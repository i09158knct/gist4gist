(function() {
  var __slice = [].slice;

  define('markdown-gist-parser', ['jquery', 'underscore', 'html-builder'], function($, _, makeHtml) {
    return {
      convertMarkdownToHtml: function(markdown) {
        return makeHtml(markdown);
      },
      wrapEachSections: function(html) {
        return '<div class="gist-head">' + html.replace(/(?=<h2)/g, '</div><div class="gist-section">') + '</div>';
      },
      convertHtmlToElement: function(html) {
        return $.parseHTML("<div class=\"gist\">" + html + "</div>");
      },
      getTargetId: function(el) {
        var id;
        return id = $(el).find('h1').text().trim();
      },
      getHead: function(el) {
        return {
          el: $(el).find('.gist-head')[0]
        };
      },
      findNameAndLineNumbers: /\s*(.+)\s*:\s*(\[.*\])\s*$/,
      extractTargetList: function(ul) {
        var lis, _ref,
          _this = this;
        _ref = ul.children, lis = 1 <= _ref.length ? __slice.call(_ref, 0) : [];
        return lis.map(function(li) {
          var fileName, lineNumbers, target, __all, _ref1, _ref2;
          if (li.innerText != null) {
            _ref1 = li.innerText.match(_this.findNameAndLineNumbers), __all = _ref1[0], fileName = _ref1[1], lineNumbers = _ref1[2];
          } else if (li.textContent != null) {
            _ref2 = li.textContent.match(_this.findNameAndLineNumbers), __all = _ref2[0], fileName = _ref2[1], lineNumbers = _ref2[2];
          } else {
            throw new Error('Cannot use "innerText" and "textContent".');
          }
          target = {};
          target[fileName] = JSON.parse(lineNumbers);
          return target;
        });
      },
      getSections: function(el) {
        var $sections,
          _this = this;
        $sections = $(el).find('.gist-section');
        return $sections.map(function(i, section) {
          var targetList, ul;
          ul = $(section).children()[1];
          targetList = ul.tagName.toLowerCase() === 'ul' ? _this.extractTargetList(ul) : [];
          return {
            el: section,
            targetList: targetList
          };
        });
      },
      parse: function(markdown) {
        var el;
        el = this.convertHtmlToElement(this.wrapEachSections(this.convertMarkdownToHtml(markdown)));
        return {
          gistId: this.getTargetId(el),
          head: this.getHead(el),
          sections: this.getSections(el)
        };
      }
    };
  });

}).call(this);
