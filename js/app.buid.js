/**
* Generates the combined and minified version of the javascript files of the file.
* It requires r.js and node.
* How to generate it? In a terminal just execute (in the js folder):
* r.js -o app.build.js
*/
({
  baseUrl: ".",
  name: "main",
  paths: {
        jquery: "vendor/jquery-1.10.2.min",
        ko: "vendor/knockout-2.3.0.min",
        underscore: "vendor/underscore-1.5.2.min",
        async: 'vendor/async',
        goog: 'vendor/goog',
        propertyParser: 'vendor/propertyParser',
        raphael: 'vendor/raphael-min',
        kartograph: 'vendor/kartograph.min',
        chroma: 'vendor/chroma.min',
        eventie: 'vendor/eventie',
        eventEmitter: 'vendor/eventEmitter',
        imagesloaded: 'vendor/imagesloaded.min',
        qtip: 'vendor/qtip.min'
  },
  shim: {
        underscore: {
            exports: '_'
        },
        kartograph: {
            deps: ['jquery', 'raphael','chroma'],
            exports: '$K'
        }
  },
  include: ['vendor/require-2.1.8.min', 'goog'],
  exclude: [],
  optimize: "uglify2",
  out: "main-built.js",
  insertRequire: ["main" ]
})