// Najprej omrežje (vedno zadnja različica), brez povezave pa zadnja shranjena kopija.
const CACHE = 'casovnik-v1';
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', e => e.waitUntil(self.clients.claim()));
self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET') return;
  e.respondWith(
    // lastne datoteke vedno preveri na strežniku, da se posodobitve pokažejo takoj
    (new URL(e.request.url).origin === location.origin ? fetch(e.request.url, { cache: 'no-cache' }) : fetch(e.request)).then(res => {
      if (res.ok || res.type === 'opaque') { const copy = res.clone(); caches.open(CACHE).then(c => c.put(e.request, copy)); }
      return res;
    }).catch(() => caches.match(e.request, { ignoreSearch: true }))
  );
});
