define 'views/navbar', [
  'jquery'
  'underscore'
  'backbone'
], ($, _, Backbone) ->
  class GistView extends Backbone.View
    constructor: (options) ->
      super
      [id] = document.location.hash.match(/[0-9a-z]+/) || ['']
      @$('#gist-id').val(id)

    el: '#navbar'
    events:
      'submit #form-gist-id': 'cahangeGist'

    cahangeGist: (event) ->
      event?.preventDefault()
      id = @$('#gist-id').val()
      document.location.hash = "/#{id}"
