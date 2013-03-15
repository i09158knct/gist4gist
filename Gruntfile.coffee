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
        files: ['<%= coffee.build.src %>', 'Gruntfile.coffee']
        tasks: ['coffee:build']
        # tasks: ['coffee:build', 'copy:build']
      copy_build:
        files: ['app/**/*.html', 'Gruntfile.coffee']
        tasks: ['copy:build']
      # coffee_test:
      #   files: ['<%= coffee.test.src %>', 'Gruntfile.coffee']
      #   tasks: ['coffee:test']
        # tasks: ['coffee:test', 'copy:test']

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
      livereload:
        options:
          middleware: (connect, options) ->
            [livereloadSnippet, (folderMount connect, './build')]

    exec:
      testacular:
        command: 'testacular start &'

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
    grunt.file.mkdir 'build/js/lib'
    component = grunt.file.readJSON 'component.json'
    for name of component.dependencies
      try
        grunt.file.copy "components/#{name}/#{name}.js", "build/js/lib/#{name}.js"
      catch e
        console.log "Error: #{name}.js not found"
        console.log e

  grunt.registerTask 'default', [
    'livereload-start'
    'connect'
    'watch'
    # 'watch:copy_build'
    # 'watch:coffee_build'
    # 'watch:livereload'
  ]

  grunt.registerTask 'test-mode', [
    'exec:testacular'
    'livereload-start'
    'connect'
    'watch'
  ]

  grunt.registerTask 'initialize', [
    'copy'
    'coffee'
    'copy-components'
  ]
