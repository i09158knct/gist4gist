(function() {
  var testFilePathList, tests;

  testFilePathList = Object.keys(window.__testacular__.files).filter(function(file) {
    return /-spec\.js$/.test(file);
  });

  tests = testFilePathList.map(function(file) {
    var test, _ref, _str_;
    _ref = file.match(/(spec\/.*)\.js$/ || []), _str_ = _ref[0], test = _ref[1];
    return test;
  });

  require({
    baseUrl: '/base/js',
    paths: {
      'text': 'lib/text',
      'jquery': 'lib/jquery',
      'underscore': 'lib/lodash',
      'backbone': 'lib/backbone',
      'showdown': 'lib/showdown',
      'test': '/base/test',
      'spec': '/base/test/spec'
    },
    shim: {
      'jquery': {
        exports: 'jQuery'
      },
      'underscore': {
        exports: '_'
      },
      'backbone': {
        exports: 'Backbone',
        deps: ['jquery', 'underscore']
      },
      'showdown': {
        exports: 'Showdown'
      },
      'lib/bootstrap.min': {
        deps: ['jquery']
      }
    },
    deps: ['test/lib/chai'],
    callback: function(chai) {
      window.chai = chai;
      window.assert = chai.assert;
      window.expect = chai.expect;
      chai.should();
      return require(tests, function() {
        var _ref;
        return (_ref = window.__testacular__).start.apply(_ref, arguments);
      });
    }
  });

}).call(this);
