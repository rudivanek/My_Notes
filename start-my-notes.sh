#!/bin/sh
# My Notes - tiny local server for Mac and Linux, only needed to install (or update) the app.
# It serves this folder at http://localhost:47123 to this computer only. Needs Python 3.
cd "$(dirname "$0")" || exit 1
URL="http://localhost:47123/"
if ! command -v python3 >/dev/null 2>&1; then
  echo ""
  echo "  Python 3 is needed but not installed."
  echo "  Mac: run  xcode-select --install   Linux: install the python3 package."
  echo "  Or use My Notes online instead: https://rudivanek.github.io/My_Notes/"
  echo ""
  exit 1
fi
echo ""
echo "  My Notes is running at $URL"
echo "  First time: click the Install icon at the right end of Chrome's address bar."
echo "  After installing, close this window (or press Ctrl+C). The app works without it."
echo ""
( sleep 1
  if [ "$(uname)" = "Darwin" ]; then open -a "Google Chrome" "$URL" 2>/dev/null || open -a "Microsoft Edge" "$URL" 2>/dev/null || open "$URL"
  else google-chrome "$URL" >/dev/null 2>&1 || chromium "$URL" >/dev/null 2>&1 || microsoft-edge "$URL" >/dev/null 2>&1 || xdg-open "$URL" >/dev/null 2>&1; fi ) &
exec python3 -c '
import http.server, socketserver
class H(http.server.SimpleHTTPRequestHandler):
    extensions_map = {**http.server.SimpleHTTPRequestHandler.extensions_map, ".webmanifest": "application/manifest+json", ".js": "text/javascript", ".html": "text/html; charset=utf-8"}
    def end_headers(self):
        self.send_header("Cache-Control", "no-cache"); super().end_headers()
    def log_message(self, *a): pass
socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("127.0.0.1", 47123), H) as s: s.serve_forever()
' 
