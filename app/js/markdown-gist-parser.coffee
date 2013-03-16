define 'markdown-gist-parser', [
  'jquery'
  'underscore'
  'html-builder'
], ($, _, makeHtml) ->

  # Markdown -> Html
  convertMarkdownToHtml: (markdown) ->
    makeHtml markdown

  # Html -> Html
  wrapEachSections: (html) ->
    '<div class="gist-head">' +
    html.replace(/(?=<h2)/g, '</div><div class="gist-section">') +
    '</div>'

  # Html -> Element
  convertHtmlToElement: (html) ->
    $.parseHTML "<div class=\"gist\">#{html}</div>"



  # Element -> Gistid
  getTargetId: (el) ->
    id = $(el).find('h1').text().trim()

  # Element -> {"el": Element}
  getHead: (el) ->
    el: $(el).find('.gist-head')[0]

  # ex. "filename.txt: [1, 2, 3]"
  findNameAndLineNumbers: /\s*(.+)\s*:\s*(\[.*\])\s*$/

  # type TargetList = [{filename: [linenumber]}]
  # Element -> TargetList
  extractTargetList: (ul) ->
    [lis...] = ul.children
    lis.map (li) =>
      if li.innerText?
        [__all, fileName, lineNumbers] = li.innerText.match @findNameAndLineNumbers
      else if li.textContent?
        [__all, fileName, lineNumbers] = li.textContent.match @findNameAndLineNumbers
      else
        throw new Error('Cannot use "innerText" and "textContent".')
      target = {}
      target[fileName] = JSON.parse lineNumbers
      target

  # Element -> [{"el": Element, "targetList": TargetList}]
  getSections: (el) ->
    $sections = $(el).find '.gist-section'
    $sections.map (i, section) =>
      ul = $(section).children()[1]
      targetList =
        if ul.tagName.toLowerCase() == 'ul'
          @extractTargetList ul
        else
          []
      el: section
      targetList: targetList

  parse: (markdown) ->
    el = @convertHtmlToElement @wrapEachSections @convertMarkdownToHtml markdown

    gistId: @getTargetId el
    head: @getHead el
    sections: @getSections el
