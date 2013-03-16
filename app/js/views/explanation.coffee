define 'views/explanation', [
  'jquery'
  'underscore'
  'backbone'
  'text!templates/explanation-section.html'
  'text!templates/explanation-head.html'
], ($, _, Backbone, sectionTemplate, headTemplate) ->
  class ExplanationView extends Backbone.View
    constructor: (options) ->
      super

    tagName: 'div'
    sectionTemplate: _.template sectionTemplate
    headTemplate: _.template headTemplate

    events:
      'click .js-file-link': 'scrollToTarget'
      'click .js-line-link': 'scrollToTarget'

    scrollToTarget: (event) ->
      targetId = $(event.target).data 'target'
      $target = $("##{targetId}")
      $gist = $('#target-gist')
      $gist.scrollTop $gist.scrollTop() + $target.position().top - 70


    render: (sectionNumber) ->
      $('.highlighted').removeClass 'highlighted'
      sectionNumber = +sectionNumber || 0
      if sectionNumber != 0
        @renderSection sectionNumber
      else
        @renderHead()
      @

    renderSection: (sectionNumber) ->
      length = @model.get('sections').length
      sectionNumber = length if sectionNumber > length
      {el, targetList} = @model.getSection sectionNumber

      for target in targetList
        for fileName, lines of target
          idPrefix = fileName.replace(/\./g, '-').trim()
          for line in lines
            $("##{idPrefix}-#{line}").addClass 'highlighted'

      @$el.html @sectionTemplate
        el: el
        length: length
        thisGistId: @model.getGistId()
        currentSectionNumber: sectionNumber
      @

    renderHead: () ->
      length = @model.get('sections').length
      {el} = @model.getHead()

      @$el.html @headTemplate
        el: el
        length: length
        thisGistId: @model.getGistId()
      @
