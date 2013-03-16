define 'models/gist', [
  'jquery'
  'underscore'
  'backbone'
  'gist-loader'
  # 'gist-loader-mock'
], ($, _, Backbone, GistLoader) ->
  loader = new GistLoader()

  class Gist extends Backbone.Model
    constructor: () ->
      super

      attrs =
        id: @attributes.id
        html_url: @attributes.html_url
        description: @attributes.description
        files: @attributes.files
        user: @attributes.user

      if attrs.user?
        Gist.normalize attrs
      else
        attrs.user = @defaults.user

      @attributes = attrs

    defaults:
      id: 'No Content'
      html_url: ''
      description: 'Gist Not found'
      files:
        'file not found':
          filename: 'file not found'
          type: 'none'
          language: 'none'
          raw_url: ''
          content: ''
      user:
        login: 'Unknown User'

    @normalize: (attrs) ->
      {id, user:{login}} = attrs
      attrs.html_url = "https://gist.github.com/#{login}/#{id}"

    @create: (data) ->
      new Gist(data)

    @createAsync: (id, cb) ->
      loader.load id, (res) ->
        gist = Gist.create res.data
        cb? gist, arguments...
