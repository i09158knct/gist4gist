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
        alert '0!!!!' if +remaining == 0
        cb? arguments...
