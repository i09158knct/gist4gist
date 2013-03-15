(function() {

  define('spec/html-builder-spec', ['html-builder'], function(makeHtml) {
    return describe('HTML Builder', function() {
      return it('should return string', function() {
        return (makeHtml('### test')).should.be.a('string');
      });
    });
  });

}).call(this);
