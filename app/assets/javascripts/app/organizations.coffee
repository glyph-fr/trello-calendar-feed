class OrganizationFeedPanel
  constructor: (@$el) ->
    @detailsInitialized = false
    @$detailsButton = @$el.find('.organization-boards-collapse-btn')
    @$detailsButton.on('click', $.proxy(@_showDetails, this))

    @clipboard = new ZeroClipboard(@$el.find('.copy-feed-url-btn'))
    @clipboard.on('ready', $.proxy(@_initializeClipboardHandler, this))

  _showDetails: ->
    return if @detailsInitialized
    @detailsInitialized = true
    url = @$detailsButton.data('details-url')
    # Let the spinner load and display before calling for details
    setTimeout((=> $.get(url).then($.proxy(@_displayDetails, this))), 10)


  _displayDetails: (markup) ->
    @$el.find('.organization-boards').html(markup)

  _initializeClipboardHandler: ->
    @clipboard.on 'aftercopy', =>
      $alert = $(
        '<div/>',
        class: 'alert alert-success alert-bottom',
        text: 'Copied URL !'
      ).prependTo('.main-container')

      setTimeout((=> $alert.remove()), 3000)


$ ->
  $('.organization-feed-panel').each (i, el) -> new OrganizationFeedPanel($(el))