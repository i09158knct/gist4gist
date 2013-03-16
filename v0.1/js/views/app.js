(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define('views/app', ['jquery', 'underscore', 'backbone', 'views/navbar', 'views/gist', 'views/explanation', 'models/gist', 'models/explanation'], function($, _, Backbone, NavbarView, GistView, ExplanationView, Gist, Explanation) {
    var AppView;
    return AppView = (function(_super) {

      __extends(AppView, _super);

      function AppView(options) {
        AppView.__super__.constructor.apply(this, arguments);
        this.navbar = new NavbarView();
        this.gist = null;
        this.explanation = null;
      }

      AppView.prototype.el = 'body';

      AppView.prototype.render = function(sectionNumber) {
        this.$('#target-gist').html(this.gist.render().el);
        this.$('#explanation').html(this.explanation.render(sectionNumber).el);
        return this;
      };

      AppView.prototype.changeGist = function(id, sectionNumber) {
        var _ref, _ref1,
          _this = this;
        if ((_ref = this.gist) != null) {
          _ref.remove();
        }
        if ((_ref1 = this.explanation) != null) {
          _ref1.remove();
        }
        this.$('#app-message').text('Loading...');
        return Explanation.createAsync(id, function(explModel) {
          var targetId;
          _this.explanation = new ExplanationView({
            model: explModel
          });
          targetId = explModel.getTargetId();
          return Gist.createAsync(targetId, function(gistModel) {
            $('#app-message').text('');
            _this.gist = new GistView({
              model: gistModel
            });
            return _this.render(sectionNumber);
          });
        });
      };

      return AppView;

    })(Backbone.View);
  });

}).call(this);
