'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "1683a7b11a91cc7a9e7446100e2321c8",
"assets/AssetManifest.bin": "629ac9ebcfeab65438d90f7010675ef6",
"assets/assets/fonts/NotoSansJP-Black.ttf": "c7cf13f6288ece850a978a0cfa764cd4",
"assets/assets/fonts/NotoSansJP-VariableFont_wght.ttf": "fdf96f36f855256a5bb5d664fd146557",
"assets/assets/fonts/NotoSansJP-Bold.ttf": "1bdb5bf9e923e1bc6418342bcf6fb3e0",
"assets/assets/fonts/NotoSansJP-SemiBold.ttf": "c44d4e4829263260330f8a6b181ec9a8",
"assets/assets/fonts/NotoSansJP-Thin.ttf": "9b3a9c37f57376f4572cc30aa6506367",
"assets/assets/fonts/NotoSansJP-Light.ttf": "b248483f59d25fca6fb75ba8196f7037",
"assets/assets/fonts/NotoSansJP-ExtraBold.ttf": "a4f1e854cd8a6816fccea648d4b1b7ac",
"assets/assets/fonts/NotoSansJP-Medium.ttf": "7aa0d1123977dab52b1e01f61f0a9a7f",
"assets/assets/fonts/NotoSansJP-ExtraLight.ttf": "e9d5260a35768a256df2ad79d376c262",
"assets/assets/fonts/NotoSansJP-Regular.ttf": "dd4fa7df965b4d3227bf42b9a77da3e0",
"assets/assets/images/3.png": "04c9d063f5127043644767f115fbeb5e",
"assets/assets/images/world_map3.jpg": "b0158a491866b816d6b1e033d77eaf37",
"assets/assets/images/ct_logo.png": "eb3cfeccbf9ce179911a412348881f22",
"assets/assets/images/header_bg.png": "bf26a88caa4fb4e4224acbf78bc41635",
"assets/assets/images/10.png": "0bc01e4aa2f27532cd79f2abb5872892",
"assets/assets/images/world_map6.jpg": "d44ae9ae676c19281491d10deca85a4e",
"assets/assets/images/worried.png": "afa1949200a09616fb86702c9a54518b",
"assets/assets/images/world_map4.jpg": "0bad8da95faeadfae169bc1171c276db",
"assets/assets/images/main_world.jpeg": "8a79ecf75aef1d1405a1a44d0050fff5",
"assets/assets/images/thinking.png": "77c1105ca64adaab4f3f23853715e3f5",
"assets/assets/images/main_bg.jpeg": "3332a158a3831d835126a8a6ab577ac8",
"assets/assets/images/voice1.png": "827108a5c12c749394617bae923fe491",
"assets/assets/images/voice2.webp": "d2078ef4d291470bcb8701f16e16d220",
"assets/assets/images/world_map7.jpg": "714d080e1fd8cad4493a17ec2f5de35b",
"assets/assets/images/ct_logo_w.png": "9a62f98cd904d7a112c4eb74a10489bc",
"assets/assets/images/thinking%2520copy.png": "b60484c039d68e3954fd391da203bcf2",
"assets/assets/images/6.png": "40aaf0abd429fdc86b1b757313f7c91b",
"assets/assets/images/world_map_rainbow.png": "03a5359459af95343f2d74cb786fd089",
"assets/assets/images/voice5.png": "d2590eaa254e309caca8b7171538c0be",
"assets/assets/images/voice4.png": "66db87d4071446d0211d9ea0e142d878",
"assets/assets/images/world_map.png": "aaa2c8c4b260f7bf73ea81cfb43baeca",
"assets/assets/images/voice3.png": "078d9feb5202a495b0f1fbe80e529c30",
"assets/assets/images/walking.png": "bacf3433894afb71947e2b6e1de42625",
"assets/assets/images/8.png": "c3cedec6476be0ae448445866e0b175d",
"assets/assets/images/world_map2.jpg": "0c2a68e5195cfa7f86e596360252083f",
"assets/assets/images/world_map5.jpg": "b88d7056a192212f6d998de981314f8f",
"assets/assets/images/ct_logo_only.png": "5aed95d29152cbe8fc9afcb71039bcbd",
"assets/assets/images/voice6.png": "084043c6d8112c076d1cdcb970c4dfe4",
"assets/FontManifest.json": "120ee00c71d8c44b692c8058d3ac3850",
"assets/fonts/MaterialIcons-Regular.otf": "571f11d56d1216cfd6cc385efad8fcd8",
"assets/AssetManifest.bin.json": "01fff1b5357d6859f455738ee2e9d0a2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "648c8b42463409145cc5b5c97d999b4d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "053bb95184df9b4e6f00cdf1cf2694e1",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "96d7406dfc2c3845993d604b30126843",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"manifest.json": "a0fe7ff377198d7709c44a201a176533",
"version.json": "3324187bf405c82f52d6a1dca0fc3bf2",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"index.html": "57c5d4153989f4fc4bc24bc184f03584",
"/": "57c5d4153989f4fc4bc24bc184f03584",
"flutter_bootstrap.js": "f5a19abbc4264fdfb7d6c579a5e1d6f4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "1d817adecd0b2ef96c1ae9588f12973b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
