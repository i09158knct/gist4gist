testFilePathList = Object.keys(window.__testacular__.files).filter (file) ->
  /-spec\.js$/.test file
tests = testFilePathList.map (file) ->
  [_str_, test] = file.match /(spec\/.*)\.js$/ || []
  test



require
  baseUrl: '/base/js'
  paths:
    'text': 'lib/text'
    'jquery': 'lib/jquery'
    'underscore': 'lib/lodash'
    'backbone': 'lib/backbone'
    'showdown': 'lib/showdown'
    'test': '/base/test'
    'spec': '/base/test/spec'
  shim:
    'jquery':
      exports: 'jQuery'
    'underscore':
      exports: '_'
    'backbone':
      exports: 'Backbone'
      deps: ['jquery', 'underscore']
    'showdown':
      exports: 'Showdown'
    'lib/bootstrap.min':
      deps: ['jquery']
  deps: ['test/lib/chai']
  callback:  (chai) ->
    window.chai = chai
    window.assert = chai.assert
    window.expect = chai.expect
    chai.should()
    require tests, () ->
      window.__testacular__.start arguments...

