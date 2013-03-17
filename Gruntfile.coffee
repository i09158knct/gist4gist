path = require 'path'
{livereloadSnippet} = require 'grunt-contrib-livereload/lib/utils'
folderMount = (connect, point) ->
  connect.static path.resolve point

module.exports = (grunt) ->
  grunt.initConfig

    watch:
      livereload:
        files: ['build/**/*']
        tasks: ['livereload']

      coffee_build:
        files: [
          '<%= coffee.build.cwd %>/<%= coffee.build.src %>'
          'Gruntfile.coffee'
        ]
        tasks: ['coffee:build']
      copy_build:
        files: [
          '<%= copy.build.cwd %>/<%= copy.build.src %>'
          'Gruntfile.coffee'
        ]
        tasks: ['copy:build']

      coffee_test:
        files: [
          '<%= coffee.test.cwd %>/<%= coffee.test.src %>'
          'Gruntfile.coffee'
        ]
        tasks: ['coffee:test']
      copy_test:
        files: [
          '<%= copy.test.cwd %>/<%= copy.test.src %>'
          'Gruntfile.coffee'
        ]
        tasks: ['copy:test']


    copy:
      build:
        expand: true
        cwd: 'app'
        src: '**/*{.html,.js,.css,.png}'
        dest: 'build'
      test:
        expand: true
        cwd: 'test'
        src: '**/*{.html,.js,.css,.png}'
        dest: 'build/test'
      dist:
        expand: true
        cwd: 'build'
        src: '**/*{.html,.css,.png}'
        dest: 'dist'


    coffee:
      build:
        expand: true
        cwd: 'app/js'
        src: '**/*.coffee'
        dest: 'build/js'
        ext: '.js'
      test:
        expand: true
        cwd: 'test'
        src: '**/*.coffee'
        dest: 'build/test'
        ext: '.js'


    connect:
      options:
        port: 9999
      build:
        options:
          middleware: (connect, options) ->
            [livereloadSnippet, (folderMount connect, './build')]
      dist:
        options:
          middleware: (connect, options) ->
            [livereloadSnippet, (folderMount connect, './dist')]


    exec:
      testacular:
        command: 'testacular start &'
      rjs:
        command: 'node node_modules/requirejs/bin/r.js -o rconfig.js'



  [
    'grunt-exec'
    'grunt-contrib-connect'
    'grunt-contrib-livereload'
    'grunt-contrib-coffee'
    'grunt-contrib-copy'
    'grunt-regarde'
  ].forEach grunt.loadNpmTasks
  grunt.renameTask 'regarde', 'watch'


  grunt.registerTask 'copy-components', () ->
    assets =
      'build/js/lib': [
        'components/underscore/underscore.js'
        'components/requirejs/require.js'
        'components/bootstrap/docs/assets/js/bootstrap.min.js'
        'components/showdown/src/showdown.js'
        'components/backbone/backbone.js'
        'components/jquery/jquery.js'
        'components/lodash/lodash.js'
        'components/text/text.js'
      ]
      'build/css': [
        'components/bootstrap/docs/assets/css/bootstrap.css'
      ]
      'build/img': [
        'components/bootstrap/docs/assets/img/glyphicons-halflings.png'
        'components/bootstrap/docs/assets/img/glyphicons-halflings-white.png'
      ]
      'test/lib': [
        'node_modules/mocha/mocha.js'
        'node_modules/mocha/mocha.css'
        'node_modules/chai/chai.js'
      ]

    for pathName, sources of assets
      grunt.file.mkdir pathName
      for source in sources
        fileName = path.basename source
        grunt.log.writeln "copying #{fileName}"
        grunt.file.copy source, "#{pathName}/#{fileName}"


  grunt.registerTask 'initialize', [
    'copy-components'
    'coffee'
    'copy'
  ]

  grunt.registerTask 'default', [
    'exec:testacular'
    'livereload-start'
    'connect:build'
    'watch'
  ]

  grunt.registerTask 'server-build', [
    'livereload-start'
    'connect:build'
    'watch'
  ]

  grunt.registerTask 'dist', [
    'initialize'
    'copy:dist'
    'exec:rjs'
  ]

  grunt.registerTask 'server-dist', [
    'livereload-start'
    'connect:dist'
    'watch'
  ]
