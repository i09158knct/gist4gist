(function() {

  define('gist-loader', ['jquery', 'underscore'], function($, _) {
    var GistLoader;
    return GistLoader = (function() {

      function GistLoader(loader) {
        if (loader == null) {
          loader = $.getJSON;
        }
        this._loader = loader;
      }

      GistLoader.prototype.load = function(id, cb) {
        var url;
        url = "https://api.github.com/gists/" + id + "?callback=?";
        return this._loader(url, function(res) {
          var remaining;
          remaining = res.meta["X-RateLimit-Remaining"];
          console.log("Remaining Rate: " + remaining);
          if (+remaining === 0) {
            alert('Error: Failed to get the Gist.\nYou\'ve run out of GitHub API rate limit.\n\nPlease refer to http://developer.github.com/v3/');
            console.log(res);
          }
          return typeof cb === "function" ? cb.apply(null, arguments) : void 0;
        });
      };

      return GistLoader;

    })();
  });

}).call(this);
