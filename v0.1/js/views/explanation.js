(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define('views/explanation', ['jquery', 'underscore', 'backbone', 'text!templates/explanation-section.html', 'text!templates/explanation-head.html'], function($, _, Backbone, sectionTemplate, headTemplate) {
    var ExplanationView;
    return ExplanationView = (function(_super) {

      __extends(ExplanationView, _super);

      function ExplanationView(options) {
        ExplanationView.__super__.constructor.apply(this, arguments);
      }

      ExplanationView.prototype.tagName = 'div';

      ExplanationView.prototype.sectionTemplate = _.template(sectionTemplate);

      ExplanationView.prototype.headTemplate = _.template(headTemplate);

      ExplanationView.prototype.render = function(sectionNumber) {
        $('.highlighted').removeClass(' highlighted');
        sectionNumber = +sectionNumber || 0;
        if (sectionNumber !== 0) {
          this.renderSection(sectionNumber);
        } else {
          this.renderHead();
        }
        return this;
      };

      ExplanationView.prototype.renderSection = function(sectionNumber) {
        var aaaaa, el, fileName, length, line, lines, section, target, targetList, _i, _j, _len, _len1;
        length = this.model.get('sections').length;
        section = this.model.getSection(sectionNumber);
        el = section.el, targetList = section.targetList;
        for (_i = 0, _len = targetList.length; _i < _len; _i++) {
          target = targetList[_i];
          for (fileName in target) {
            lines = target[fileName];
            aaaaa = fileName.replace(/\./g, '-');
            for (_j = 0, _len1 = lines.length; _j < _len1; _j++) {
              line = lines[_j];
              $("#" + aaaaa + "-" + line).addClass('highlighted');
            }
          }
        }
        this.$el.html(this.sectionTemplate({
          el: el,
          length: length,
          thisGistId: this.model.getGistId(),
          currentSectionNumber: sectionNumber
        }));
        return this;
      };

      ExplanationView.prototype.renderHead = function() {
        var el, head, length;
        length = this.model.get('sections').length;
        head = this.model.getHead();
        el = head.el;
        window.aa = el;
        this.$el.html(this.headTemplate({
          el: el,
          length: length,
          thisGistId: this.model.getGistId()
        }));
        return this;
      };

      return ExplanationView;

    })(Backbone.View);
  });

}).call(this);
