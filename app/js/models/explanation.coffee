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
      @attributes = mdgParser.parse markdown
      @_thisGistId = thisGistId

      head = @attributes.head
      waste = $(head.el).find('h1')
      waste.remove()

      sections = @attributes.sections
      for section in sections
        ul = Explanation.buildHtmlTargetList section.targetList
        $plainUl = $(section.el).find('h2').eq(0).next()
        if $plainUl[0].tagName.toLowerCase() == 'ul'
          $plainUl.replaceWith(ul)

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



    @buildHtmlListItem: (targetName, lines) ->
      validName = targetName.replace(/\./g, '-').trim()
      fileId = "gist-#{validName}"
      fileButton =
        "<button class=\"js-file-link btn btn-link\" data-target=\"#{fileId}\">" +
        targetName +
        '</button>'
      lineId = (line) -> "#{validName}-#{line}"
      lineButtons = for line in lines
        "<button class=\"js-line-link btn btn-small\" data-target=\"#{lineId(line)}\">" +
        line +
        '</button>'
      li =
        '<li>' + fileButton + ' : ' + lineButtons.join(' ') + '</li>'

    @buildHtmlTargetList: (targetList) ->
      lis = for target in targetList
        @buildHtmlListItem target...
      ul = '<ul class="target-list">' + lis.join('') + '</ul>'


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
