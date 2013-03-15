(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __slice = [].slice;

  define('models/explanation', ['jquery', 'underscore', 'backbone', 'gist-loader', 'markdown-gist-parser'], function($, _, Backbone, GistLoader, mdgParser) {
    var Explanation, loader;
    loader = new GistLoader();
    return Explanation = (function(_super) {

      __extends(Explanation, _super);

      function Explanation(markdown, thisGistId) {
        var head, waste;
        Explanation.__super__.constructor.apply(this, arguments);
        this.attributes = mdgParser.parse(markdown);
        this._thisGistId = thisGistId;
        head = this.getHead();
        waste = $(head.el).find('h1');
        if (waste.text().trim() === this.getTargetId()) {
          waste.remove();
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
