define 'models/explanation', [
  'jquery'
  'underscore'
  'backbone'
  'markdown-gist-parser'
  # 'gist-loader-mock'
  'gist-loader'
], ($, _, Backbone, mdgParser, GistLoader) ->
  loader = new GistLoader()

  class Explanation extends Backbone.Model
    constructor: (markdown, thisGistId) ->
      super
      article = mdgParser.parse markdown

      do () ->
        targetGistIdHolder = $(article.head.el).find('h1').first()
        targetGistIdHolder.remove()

      sections = for section in article.sections
        Explanation.reconstructSection section, true

      @attributes =
        targetId   : article.gistId
        thisGistId : thisGistId
        head       : article.head
        sections   : sections

    getGistId: () ->
      @attributes.thisGistId

    getTargetId: () ->
      @attributes.targetId

    getHead: () ->
      @attributes.head

    getSection: (number) ->
      number = +number || 0
      if number != 0
        @attributes.sections[number - 1]
      else
        @getHead()



    @reconstructSection: ({targetList, el}, destruct=false) ->
      if destruct
        $el = $(el)
      else
        $el = $(el).clone()

      $caption = $el.find('h2').first()
      $targetList = $caption.next()
      caption = $caption.text()

      $caption.remove()
      $targetList.remove() if $targetList[0].tagName.toLowerCase() == 'ul'

      struct =
        caption: caption
        targetList: targetList
        el: $el[0]


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
