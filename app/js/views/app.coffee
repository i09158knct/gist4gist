define 'views/app', [
  'jquery'
  'underscore'
  'backbone'
  'views/navbar'
  'views/gist'
  'views/explanation'
  'models/gist'
  'models/explanation'
], ($, _, Backbone, NavbarView, GistView, ExplanationView, Gist, Explanation) ->
  class AppView extends Backbone.View
    constructor: (options) ->
      super
      @navbar = new NavbarView()
      @gist = null
      @explanation = null

    el: 'body'

    render: (sectionNumber) ->
      @gist.render().el
      @explanation.render(sectionNumber).el
      @

    changeGist: (id, sectionNumber) ->
      @gist?.remove()
      @explanation?.remove()
      @$('#app-message').text 'Loading...'
      Explanation.createAsync id, (explModel) =>
        @explanation = new ExplanationView(model: explModel)
        @explanation.setElement @$('#explanation')
        targetId = explModel.getTargetId()
        Gist.createAsync targetId, (gistModel) =>
          $('#app-message').text ''
          @gist = new GistView(model: gistModel)
          @gist.setElement @$('#target-gist')
          @render sectionNumber
