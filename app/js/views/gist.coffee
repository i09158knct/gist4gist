define 'views/gist', [
  'jquery'
  'underscore'
  'backbone'
  'text!templates/gist.html'
], ($, _, Backbone, template) ->
  class GistView extends Backbone.View
    constructor: (options) ->
      super

    template: _.template template

    render: () ->
      @$el.html @template @model.toJSON()
      @
