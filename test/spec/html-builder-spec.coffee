define 'spec/html-builder-spec', [
  'html-builder'
], (makeHtml) ->
  describe 'HTML Builder', () ->
    it 'should return string', () ->
      (makeHtml '### test').should.be.a 'string'

