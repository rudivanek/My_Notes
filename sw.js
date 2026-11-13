// My Notes service worker: lets the installed app start without any server,
// and works offline. It only stores the app's own files — never your notes.
const CACHE = 'my-notes-v50-2026-11-13';
const FILES = ['./', './index.html', './manifest.webmanifest', './icon-192.png', './icon-512.png', './icon-maskable-512.png'];
self.addEventListener('install', e => { e.waitUntil(caches.open(CACHE).then(c => c.addAll(FILES)).then(() => self.skipWaiting())); });
self.addEventListener('activate', e => { e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== CACHE && !k.startsWith('my-notes-mobile-')).map(k => caches.delete(k)))).then(() => self.clients.claim())); });
self.addEventListener('fetch', e => {
  const url = new URL(e.request.url);
  if (e.request.method !== 'GET' || url.origin !== location.origin) return;
  // v41: the phone version in m/ has its own service worker — never answer for it
  if (url.pathname.startsWith(new URL('m/', self.registration.scope).pathname)) return;
  const last = url.pathname.split('/').pop();
  const isPage = url.pathname.endsWith('/') || last === 'index.html' || (e.request.mode === 'navigate' && !last.includes('.'));
  // anything that isn't the app itself (manual, video, sample vault on GitHub Pages) goes straight to the network
  if (!isPage && !FILES.includes('./' + last)) return;
  e.respondWith((async () => {
    const cache = await caches.open(CACHE);
    const cached = await cache.match(isPage ? './index.html' : e.request, { ignoreSearch: true });
    // refresh the saved copy in the background — but only with genuine My Notes files,
    // so another program using the same port later can never replace the app
    const refresh = fetch(e.request).then(async r => {
      if (!r.ok) return null;
      if (isPage){ const t = await r.clone().text(); if (!t.includes('<title>My Notes</title>')) return null; await cache.put('./index.html', r.clone()); }
      else if (FILES.includes('./' + url.pathname.split('/').pop())) await cache.put(e.request, r.clone());
      return r;
    }).catch(() => null);
    if (cached){ e.waitUntil(refresh); return cached; }
    return (await refresh) || new Response('My Notes is offline and not installed yet.', { status: 503 });
  })());
});
