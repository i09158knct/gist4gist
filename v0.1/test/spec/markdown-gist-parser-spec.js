(function() {

  define('spec/markdown-gist-parser-spec', ['jquery', 'markdown-gist-parser'], function($, mdgParser) {
    return describe('Markdown gist parser', function() {
      var source;
      source = null;
      beforeEach(function() {
        return source = '123456\n======\n\ndescription...\n\n1. first\n--------\n\n- test.txt: [1, 2, 3]\n-  test2.js : [10,20,30]\n\ncontents...\ncontents...\ncontents...\ncontents...\n\n2. second\n---------\n\ncontents...\ncontents...\ncontents...\ncontents...';
      });
      describe('convertMarkdownToHtml', function() {
        var html;
        html = null;
        beforeEach(function() {
          return html = mdgParser.convertMarkdownToHtml(source);
        });
        return it('should return string', function() {
          return mdgParser.convertMarkdownToHtml(source).should.be.a('string');
        });
      });
      describe('wrapEachSections', function() {
        var $el, html;
        html = null;
        $el = null;
        beforeEach(function() {
          html = mdgParser.wrapEachSections(mdgParser.convertMarkdownToHtml(source));
          return $el = $($.parseHTML(html));
        });
        return it('should contain .gist-head', function() {
          return $el.find('.gist-head').should.be.not.empty;
        });
      });
      return describe('', function() {
        var $el, el;
        el = null;
        $el = null;
        beforeEach(function() {
          el = mdgParser.convertHtmlToElement(mdgParser.wrapEachSections(mdgParser.convertMarkdownToHtml(source)));
          return $el = $(el);
        });
        describe('convertHtmlToElement', function() {
          return it('should wrap element by .gist', function() {
            return assert($el.is('.gist'));
          });
        });
        describe('getTargetId', function() {
          var result;
          result = null;
          before(function() {
            return result = mdgParser.getTargetId(el);
          });
          return it('should detect target Gist ID from caption', function() {
            return result.should.equal('123456');
          });
        });
        describe('getHead', function() {
          var result;
          result = null;
          before(function() {
            return result = mdgParser.getHead(el);
          });
          return it('should return {el: head element}', function() {
            result.should.have.keys(['el']);
            return assert($(result.el).is('.gist-head'));
          });
        });
        return describe('getSections', function() {
          var result;
          result = null;
          before(function() {
            return result = mdgParser.getSections(el);
          });
          return it('should have section elements');
        });
      });
    });
  });

}).call(this);
