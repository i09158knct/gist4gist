require.config
  paths:
    'text': 'lib/text'
    'jquery': 'lib/jquery'
    'underscore': 'lib/lodash'
    'backbone': 'lib/backbone'
    'showdown': 'lib/showdown'
  shim:
    'jquery':
      exports: 'jQuery'
    'underscore':
      exports: '_'
    'backbone':
      exports: 'Backbone'
      deps: ['jquery', 'underscore']
    'showdown':
      exports: 'Showdown'
    'lib/bootstrap.min':
      deps: ['jquery']
require [
  'jquery'
  'routers/app'
  'lib/bootstrap.min'
], ($, AppRouter) ->
  router = new AppRouter pushState: true
  Backbone.history.start()

  window.router = router
