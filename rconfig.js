({
  name: 'main',
  appDir: 'build/js/',
  baseUrl: './',
  dir: 'dist/js/',

  paths: {
    'text': 'lib/text',
    'jquery': 'lib/jquery',
    'underscore': 'lib/lodash',
    'backbone': 'lib/backbone',
    'showdown': 'lib/showdown'
  },
  shim: {
    'jquery': {
      exports: 'jQuery'
    },
    'underscore': {
      exports: '_'
    },
    'backbone': {
      exports: 'Backbone',
      deps: ['jquery', 'underscore']
    },
    'showdown': {
      exports: 'Showdown'
    },
    'lib/bootstrap.min': {
      deps: ['jquery']
    }
  }
})
