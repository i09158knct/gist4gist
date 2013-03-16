define 'routers/app', [
  'jquery'
  'underscore'
  'backbone'
  'views/app'
], ($, _, Backbone, AppView) ->
  class AppRouter extends Backbone.Router
    constructor: () ->
      super
      @app = new AppView()
      @prevId = null

    routes:
      '(index)':       'index'
      ':id':           'show'
      ':id/(:number)': 'show'

    index: () ->
      console.log 'index'

    show: (id, sectionNumber) ->
      console.log 'show'
      if @prevId == id
        @app.render sectionNumber
      else
        @prevId = id
        @app.changeGist id, sectionNumber
