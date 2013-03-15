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
      '(index)': 'index'
      'new':   'new'
      ':id(/(:number))':   'show'

    index: () ->
      console.log 'index'

    new: () ->
      console.log 'new'

    show: (id, sectionNumber) ->
      if @prevId == id
        @app.render sectionNumber
      else
        @prevId = id
        @app.changeGist id, sectionNumber