// Service worker Saccoin: jaringan dulu (agar update cepat terlihat), cadangan dari cache saat offline.
// Permintaan ke Supabase tidak pernah disimpan di cache.
const V='saccoin-v1',CORE=['./','index.html','config.js','manifest.json','favicon.svg','icon-192.png'];
self.addEventListener('install',e=>{e.waitUntil(caches.open(V).then(c=>c.addAll(CORE)).then(()=>self.skipWaiting()))});
self.addEventListener('activate',e=>{e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==V).map(k=>caches.delete(k)))).then(()=>self.clients.claim()))});
self.addEventListener('fetch',e=>{const r=e.request,u=new URL(r.url);if(r.method!=='GET'||u.hostname.endsWith('supabase.co'))return;
e.respondWith(fetch(r).then(res=>{if(res.ok&&(u.origin===location.origin||/cdnjs\.cloudflare|cdn\.jsdelivr|fonts\.(googleapis|gstatic)/.test(u.hostname))){const cp=res.clone();caches.open(V).then(c=>c.put(r,cp))}return res}).catch(()=>caches.match(r).then(m=>m||caches.match('index.html'))))});
