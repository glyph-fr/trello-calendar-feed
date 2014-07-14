class MagicMenu
  constructor: (@$el) ->   

    @$magicLine = @$el.find($(".magic-line"))

    @$active = @$el.find('.active')

    @rebind()

    @$el.find('li').hover ( (e) =>
      $el = $(e.currentTarget)
      leftPos = $el.position().left
      newWidth = $el.width()

      @$magicLine.stop().animate
        left: leftPos
        width: newWidth,
        250
    ), =>
      @$magicLine.stop().animate
        left: @$magicLine.data("origLeft")
        width: @$magicLine.data("origWidth")

    @$el.find('li').click ( (e) =>
      @$active = $(e.currentTarget)

      @rebind()
    )

  rebind: ->
    @$magicLine
      .width(@$active.width())
      .css("left", @$active.position().left)
      .data("origLeft", @$magicLine.position().left)
      .data "origWidth", @$magicLine.width()

$ ->
  # MAGIC LINE
  $magicMenu = $(".magic-menu")

  $magicMenu.each ->
    new MagicMenu($(this))
      