define 'html-builder', [
  'showdown'
], (Showdown) ->
  converter = new Showdown.converter
  (text) -> converter.makeHtml text
