// My Notes Mobile service worker: lets the app start offline. It only stores the app's own
// files — never your notes (those live in the app's own database on the phone) and never
// anything from Dropbox.
const CACHE = 'my-notes-mobile-v41-2026-11-12';
const FILES = ['./', './manifest.webmanifest', '../icon-192.png', '../icon-512.png', '../icon-maskable-512.png'];
const PAGE = new URL('./', self.registration.scope).href;
self.addEventListener('install', e => { e.waitUntil(caches.open(CACHE).then(c => c.addAll(FILES)).then(() => self.skipWaiting())); });
self.addEventListener('activate', e => { e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k.startsWith('my-notes-mobile-') && k !== CACHE).map(k => caches.delete(k)))).then(() => self.clients.claim())); });
self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET') return;
  const url = new URL(e.request.url);
  if (url.origin !== location.origin) return;                  // Dropbox and other sites: straight to the network
  const isPage = e.request.mode === 'navigate' && url.href.startsWith(PAGE) && (url.pathname.endsWith('/') || url.pathname.endsWith('/index.html'));
  const known = FILES.map(f => new URL(f, self.registration.scope).href);
  if (!isPage && !known.includes(url.origin + url.pathname)) return;
  e.respondWith((async () => {
    const cache = await caches.open(CACHE), key = isPage ? PAGE : url.origin + url.pathname;
    const cached = await cache.match(key);
    const fresh = fetch(e.request).then(async r => {
      if (!r.ok) return null;
      if (isPage){ const t = await r.clone().text(); if (!t.includes('<title>My Notes Mobile</title>')) return null; }
      await cache.put(key, r.clone()); return r;
    }).catch(() => null);
    if (cached){ e.waitUntil(fresh); return cached; }
    return (await fresh) || new Response('My Notes Mobile is offline and not installed yet.', { status: 503 });
  })());
});
