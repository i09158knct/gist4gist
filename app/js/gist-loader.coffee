define 'gist-loader', [
  'jquery'
  'underscore'
], ($, _) ->
  class GistLoader
    constructor: (loader=$.getJSON) ->
      @_loader = loader

    load: (id, cb) ->
      url = "https://api.github.com/gists/#{id}?callback=?"
      @_loader url, (res) ->
        remaining = res.meta["X-RateLimit-Remaining"]
        console.log "Remaining Rate: #{remaining}"
        if +remaining == 0
          alert '''
            Error: Failed to get the Gist.
            You've run out of GitHub API rate limit.

            Please refer to http://developer.github.com/v3/
            '''
          console.log res
        cb? arguments...
