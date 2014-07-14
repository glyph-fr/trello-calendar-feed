
$.fn.glyphForm = ->
  @each (i, container) ->
    $container = $(container)
    unless ($form = $container.filter("form")).length
      $form = $container.find('form')

    return unless $form.length

    #----------- Spinner constructor-----------#
    $spinner = $container.find('input.spinner-input')
    $spinner.each ->
      $this = $(this)
      $this.parent().spinner('value')

    #---------- File upload constructor -------#
    $inputFile = $container.find('input.file-upload')
    $inputFile.each ->
      $this = $(this)
      $this.removeClass "form-control"

    $inputImage = $container.find('input.image-upload')
    $inputImage.each ->
      $this = $(this)
      $this.removeClass "form-control"

    #----------- Select -----------#
    $container.find('select').each (i, el) ->
      $el = $(el)
      $el.selectize()

    #----------- Datepicker -----------#
    $inputDateTimeWarpper = $container.find('input.datetime')
    $inputDateTimeWarpper.each ->
      $this = $(this)

      $this.datetimepicker( 
        lang: 'fr'
        format: 'm/d/Y H:i'
        dayOfWeekStart: 1
      )

      $onclickBtn = $this.parent().find('.btn-onclick-event')
      $onclickBtn.on 'click', ->
        $this.datetimepicker('show')


    $inputDateTimeWarpper = $container.find('input.date')
    $inputDateTimeWarpper.each ->
      $this = $(this)

      $this.datetimepicker(
        lang: 'fr'
        format:'m/d/Y'
        timepicker: false
        dayOfWeekStart: 1
      )  

      $onclickBtn = $this.parent().find('.btn-onclick-event')
      $onclickBtn.on 'click', ->
        $this.datetimepicker('show')
    
    #----------- Colorpicker -----------#
    $inputColorPicker = $container.find('input.colorpicker').each ->
      $this = $(this)
      color = $this.val()
      $this.parent().colorpicker()
      

$ ->
  $('.glyph-form').glyphForm()

  