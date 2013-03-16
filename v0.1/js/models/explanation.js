(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __slice = [].slice;

  define('models/explanation', ['jquery', 'underscore', 'backbone', 'markdown-gist-parser', 'gist-loader'], function($, _, Backbone, mdgParser, GistLoader) {
    var Explanation, loader;
    loader = new GistLoader();
    return Explanation = (function(_super) {

      __extends(Explanation, _super);

      function Explanation(markdown, thisGistId) {
        var $plainUl, head, section, sections, ul, waste, _i, _len;
        Explanation.__super__.constructor.apply(this, arguments);
        this.attributes = mdgParser.parse(markdown);
        this._thisGistId = thisGistId;
        head = this.attributes.head;
        waste = $(head.el).find('h1');
        waste.remove();
        sections = this.attributes.sections;
        for (_i = 0, _len = sections.length; _i < _len; _i++) {
          section = sections[_i];
          ul = Explanation.buildHtmlTargetList(section.targetList);
          $plainUl = $(section.el).find('h2').eq(0).next();
          if ($plainUl[0].tagName.toLowerCase() === 'ul') {
            $plainUl.replaceWith(ul);
          }
        }
      }

      Explanation.prototype.getGistId = function() {
        return this._thisGistId;
      };

      Explanation.prototype.getTargetId = function() {
        return this.attributes.gistId;
      };

      Explanation.prototype.getHead = function() {
        return this.attributes.head;
      };

      Explanation.prototype.getSection = function(number) {
        number = +number || 0;
        if (number !== 0) {
          return this.attributes.sections[number - 1];
        } else {
          return this.getHead();
        }
      };

      Explanation.buildHtmlListItem = function(targetName, lines) {
        var fileButton, fileId, li, line, lineButtons, lineId, validName;
        validName = targetName.replace(/\./g, '-').trim();
        fileId = "gist-" + validName;
        fileButton = ("<button class=\"js-file-link btn btn-link\" data-target=\"" + fileId + "\">") + targetName + '</button>';
        lineId = function(line) {
          return "" + validName + "-" + line;
        };
        lineButtons = (function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = lines.length; _i < _len; _i++) {
            line = lines[_i];
            _results.push(("<button class=\"js-line-link btn btn-small\" data-target=\"" + (lineId(line)) + "\">") + line + '</button>');
          }
          return _results;
        })();
        return li = '<li>' + fileButton + ' : ' + lineButtons.join(' ') + '</li>';
      };

      Explanation.buildHtmlTargetList = function(targetList) {
        var li, lines, lis, target, targetName, ul;
        lis = (function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = targetList.length; _i < _len; _i++) {
            target = targetList[_i];
            li = (function() {
              var _results1;
              _results1 = [];
              for (targetName in target) {
                lines = target[targetName];
                _results1.push(this.buildHtmlListItem(targetName, lines));
              }
              return _results1;
            }).call(this)[0];
            _results.push(li);
          }
          return _results;
        }).call(this);
        return ul = '<ul class="target-list">' + lis.join('') + '</ul>';
      };

      Explanation.create = function(data, fileName) {
        var file;
        if (fileName == null) {
          fileName = 'explanation.md';
        }
        file = data.files[fileName];
        if (file == null) {
          console.log(JSON.stringify(data, null, 2));
          throw new Error("" + fileName + " not found");
        } else if (file.language !== 'Markdown') {
          console.log(JSON.stringify(data, null, 2));
          throw new Error("" + fileName + " is not a Markdown file");
        } else {
          return new Explanation(file.content, data.id);
        }
      };

      Explanation.createAsync = function(id, fileName, cb) {
        if (typeof fileName === 'function') {
          cb = fileName;
          fileName = null;
        }
        return loader.load(id, function(res) {
          var explanation;
          explanation = Explanation.create(res.data, fileName);
          return typeof cb === "function" ? cb.apply(null, [explanation].concat(__slice.call(arguments))) : void 0;
        });
      };

      return Explanation;

    })(Backbone.Model);
  });

}).call(this);
