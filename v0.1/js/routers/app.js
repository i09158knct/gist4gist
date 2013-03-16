(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define('routers/app', ['jquery', 'underscore', 'backbone', 'views/app'], function($, _, Backbone, AppView) {
    var AppRouter;
    return AppRouter = (function(_super) {

      __extends(AppRouter, _super);

      function AppRouter() {
        AppRouter.__super__.constructor.apply(this, arguments);
        this.app = new AppView();
        this.prevId = null;
      }

      AppRouter.prototype.routes = {
        '(index)': 'index',
        ':id': 'show',
        ':id/(:number)': 'show'
      };

      AppRouter.prototype.index = function() {
        return console.log('index');
      };

      AppRouter.prototype.show = function(id, sectionNumber) {
        console.log('show');
        if (this.prevId === id) {
          return this.app.render(sectionNumber);
        } else {
          this.prevId = id;
          return this.app.changeGist(id, sectionNumber);
        }
      };

      return AppRouter;

    })(Backbone.Router);
  });

}).call(this);
