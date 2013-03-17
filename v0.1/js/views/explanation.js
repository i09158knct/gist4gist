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

      ExplanationView.prototype.sectionTemplate = _.template(sectionTemplate);

      ExplanationView.prototype.headTemplate = _.template(headTemplate);

      ExplanationView.prototype.events = {
        'click .js-file-link': 'scrollToTarget',
        'click .js-line-link': 'scrollToTarget'
      };

      ExplanationView.prototype.scrollToTarget = function(event) {
        var $gist, $target, targetId;
        targetId = $(event.target).data('target');
        $target = $("#" + targetId);
        $gist = $('#target-gist');
        return $gist.scrollTop($gist.scrollTop() + $target.position().top - 70);
      };

      ExplanationView.prototype.render = function(sectionNumber) {
        ExplanationView.disableHighlighting();
        sectionNumber = +sectionNumber || 0;
        if (sectionNumber !== 0) {
          this.renderSection(sectionNumber);
        } else {
          this.renderHead();
        }
        return this;
      };

      ExplanationView.prototype.renderSection = function(sectionNumber) {
        var el, length, targetList, _ref;
        length = this.model.get('sections').length;
        if (sectionNumber > length) {
          sectionNumber = length;
        }
        _ref = this.model.getSection(sectionNumber), el = _ref.el, targetList = _ref.targetList;
        ExplanationView.highlightTargets(targetList);
        this.$el.html(this.sectionTemplate({
          el: el,
          length: length,
          thisGistId: this.model.getGistId(),
          currentSectionNumber: sectionNumber
        }));
        return this;
      };

      ExplanationView.prototype.renderHead = function() {
        var el, length;
        length = this.model.get('sections').length;
        el = this.model.getHead().el;
        this.$el.html(this.headTemplate({
          el: el,
          length: length,
          thisGistId: this.model.getGistId()
        }));
        return this;
      };

      ExplanationView.disableHighlighting = function() {
        return $('.highlighted').removeClass('highlighted');
      };

      ExplanationView.highlightTargets = function(targetList) {
        var fileName, idPrefix, line, lines, target, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = targetList.length; _i < _len; _i++) {
          target = targetList[_i];
          fileName = target[0], lines = target[1];
          idPrefix = fileName.replace(/\./g, '-').trim();
          _results.push((function() {
            var _j, _len1, _results1;
            _results1 = [];
            for (_j = 0, _len1 = lines.length; _j < _len1; _j++) {
              line = lines[_j];
              _results1.push($("#" + idPrefix + "-" + line).addClass('highlighted'));
            }
            return _results1;
          })());
        }
        return _results;
      };

      return ExplanationView;

    })(Backbone.View);
  });

}).call(this);
