define 'spec/markdown-gist-parser-spec', [
  'jquery'
  'markdown-gist-parser'
], ($, mdgParser) ->
  describe 'Markdown gist parser', () ->
    source = null
    beforeEach () ->
      source = '''
      123456
      ======

      description...

      1. first
      --------

      - test.txt: [1, 2, 3]
      -  test2.js : [10,20,30]

      contents...
      contents...
      contents...
      contents...

      2. second
      ---------

      contents...
      contents...
      contents...
      contents...
      '''

    describe 'convertMarkdownToHtml', () ->
      html = null
      beforeEach () ->
        html =
          mdgParser.convertMarkdownToHtml \
          source

      it 'should return string', () ->
        mdgParser.convertMarkdownToHtml(source).should.be.a 'string'



    describe 'wrapEachSections', () ->
      html = null
      $el = null
      beforeEach () ->
        html =
          mdgParser.wrapEachSections \
          mdgParser.convertMarkdownToHtml \
          source
        $el = $ $.parseHTML html

      it 'should contain .gist-head', () ->
        $el.find('.gist-head').should.be.not.empty



    describe '', () ->
      el = null
      $el = null
      beforeEach () ->
        el =
          mdgParser.convertHtmlToElement \
          mdgParser.wrapEachSections \
          mdgParser.convertMarkdownToHtml \
          source
        $el = $ el

      describe 'convertHtmlToElement', () ->
        it 'should wrap element by .gist', () ->
          assert $el.is('.gist')

      describe 'getTargetId', () ->
        result = null
        before () ->
          result = mdgParser.getTargetId el

        it 'should detect target Gist ID from caption', () ->
          result.should.equal '123456'

      describe 'getHead', () ->
        result = null
        before () ->
          result = mdgParser.getHead el

        it 'should return {el: head element}', () ->
          result.should.have.keys ['el']
          assert $(result.el).is '.gist-head'

      describe 'getSections', () ->
        result = null
        before () ->
          result = mdgParser.getSections el

        it 'should have section elements'
