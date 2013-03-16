define 'models/explanation', [
  'jquery'
  'underscore'
  'backbone'
  'markdown-gist-parser'
  'gist-loader'
  # 'gist-loader-mock'
], ($, _, Backbone, mdgParser, GistLoader) ->
  loader = new GistLoader()

  class Explanation extends Backbone.Model
    constructor: (markdown, thisGistId) ->
      super
      @attributes = mdgParser.parse markdown
      @_thisGistId = thisGistId

      head = @getHead()
      waste = $(head.el).find('h1')
      if waste.text().trim() == @getTargetId()
        waste.remove()

    getGistId: () ->
      @_thisGistId

    getTargetId: () ->
      @attributes.gistId

    getHead: () ->
      @attributes.head

    getSection: (number) ->
      number = +number || 0
      if number != 0
        @attributes.sections[number - 1]
      else
        @getHead()


    @create: (data, fileName='explanation.md') ->
      file = data.files[fileName]
      if !file?
        console.log JSON.stringify data, null, 2
        throw new Error("#{fileName} not found")
      else if file.language != 'Markdown'
        console.log JSON.stringify data, null, 2
        throw new Error("#{fileName} is not a Markdown file")
      else
        new Explanation(file.content, data.id)

    @createAsync: (id, fileName, cb) ->
      if typeof fileName == 'function'
        cb = fileName
        fileName = null
      loader.load id, (res) ->
        explanation = Explanation.create res.data, fileName
        cb? explanation, arguments...
