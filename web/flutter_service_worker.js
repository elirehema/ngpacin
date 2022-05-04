'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/translations/sw.json": "529d6a01f011bb1e901e905a5391e35f",
"assets/assets/translations/en.json": "58f6bd82a508e1bbf1ffbb7bd48c7ecb",
"assets/FontManifest.json": "52ddb233acf482b1dbc9e11394738e8a",
"assets/AssetManifest.json": "f645144766ac5a08eff113132720a655",
"assets/images/piggy.png": "f71aa9b8576f298c225781c2e9b58a1f",
"assets/images/warning_icon.png": "e137c60e2ea6aa935b5ca39e13c42e9b",
"assets/images/group.png": "a3b90c725a63edb53bbfdcb004492b66",
"assets/images/back.png": "6e367c647ef30606123b365bc91e8fdd",
"assets/images/member.png": "fa5d75127443c4368a6685db86794b4f",
"assets/images/group_ico.png": "ed2b5628adf180a15f16a06ed3b5a313",
"assets/images/cash.png": "a23352ad28485d5a26d371eeb46ec6ac",
"assets/images/loan.png": "ba79792e203171a8bc7c9f05af48e04a",
"assets/images/electricity.png": "f0db7ceace372ec6f6675799ae1a1175",
"assets/images/passcode.png": "3ee3f45eff4858d484a01534cac1c23b",
"assets/images/family.png": "64a369a6fbcbbd0d7d0f438791fdefb0",
"assets/images/icon_warning.png": "6ef94b77690f0ae1a2198be1dc0d7b73",
"assets/images/tick.png": "de69ec60eaf0d94def66bc24de5ffc72",
"assets/images/password.png": "47bf547408b8fb7d367a58716e3d0f0d",
"assets/images/icon.png": "85f8b3ecdf2dd8051c039a529f8e338d",
"assets/images/refinery.png": "93474827a85b26945dd9dafe2cfec289",
"assets/images/qrcode.png": "521ac29c2efa8f37472e398e75340433",
"assets/images/peoples.png": "e9a7b72d7d1023fb9e8788a6749c9692",
"assets/images/user_icon.png": "eb76b7a31ff519d439005af24cce66f9",
"assets/images/group_icon.png": "9e16cdc95c3ac396c96df5b3dc660093",
"assets/images/tpb_logo.png": "9f8c238165393552ec3e8fdde5120749",
"assets/images/placeholder.gif": "baeaf0c7f02777839e58eed62cc714c4",
"assets/images/money.png": "00e56676e23522eee0ccea3c67e65388",
"assets/images/filter_variant.png": "1631cc9d137f072e772858a0a31b1227",
"assets/NOTICES": "d2a58ab987d520a5d85466a1ba493e7b",
"assets/fonts/FiraSans-Regular.ttf": "895f5b025a6cc4924b263f6beb06c777",
"assets/fonts/FiraSans-ExtraLightItalic.ttf": "c606dc72dd989c9b294d4377851f78a0",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/FiraSans-ExtraLight.ttf": "882c94daf9a5a47d4450feef12da7c22",
"assets/fonts/FiraSans-LightItalic.ttf": "6d15364fb3883d074dea8096229942a7",
"assets/fonts/FiraSans-Light.ttf": "034229170eceddca9e300e8d2a4c8208",
"assets/fonts/FiraSans-Thin.ttf": "979e1f11f340455e5a96e81b0e7de352",
"assets/fonts/FiraSans-ThinItalic.ttf": "68cf3ce6260664b260e5474d7169cd39",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/progress_dialog/assets/double_ring_loading_io.gif": "e5b006904226dc824fdb6b8027f7d930",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en-US.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/easy_localization/i18n/en.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "174c02fc4609e8fc4389f5d21f16a296",
"index.html": "03397ead15ecfafda6887878c8858e1b",
"/": "03397ead15ecfafda6887878c8858e1b",
"version.json": "d75b5ea4d59e2aafe556a5d9ddc482f3",
"manifest.json": "bbf096d4b21132e3de3a45fec751771a",
"main.dart.js": "1f819b3a071779a238393f1e24705485",
"favicon.png": "2765281b412bd2ee27c1677e8f5f1ea2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
