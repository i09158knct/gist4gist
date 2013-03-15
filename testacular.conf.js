// Testacular configuration
// Generated on Thu Mar 14 2013 00:56:02 GMT+0900 (JST)


// base path, that will be used to resolve files and exclude
basePath = 'build';


// list of files / patterns to load in the browser
files = [
  MOCHA,
  MOCHA_ADAPTER,
  REQUIRE,
  REQUIRE_ADAPTER,

  {pattern: 'test/lib/chai.js', included: false},

  // bug http://testacular.github.com/0.6.0/plus/RequireJS.html
  // put what used to be in your requirejs 'shim' config here,
  // these files will be included without requirejs
  'js/lib/jquery.js',
  'js/lib/underscore.js',
  'js/lib/backbone.js',
  'js/lib/showdown.js',
  'js/lib/bootstrap.min.js',

  {pattern: 'js/lib/*.js', included: false},
  {pattern: 'js/**/*.js', included: false},

  'test/spec/*.js',
  'test/main-test.js'
];


// list of files to exclude
exclude = [

];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['dots'];


// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = [
  'PhantomJS',
  // 'Chrome',
];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
