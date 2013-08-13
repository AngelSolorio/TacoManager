class HeaderAndFooter
  constructor: ->
    header = $('#logo-header')
    footer = $('#logo-footer')

    if $('.signout-link').length > 0 or $('#signup-button').length > 0
      if header.find('.big-logo-header').length > 0
        header.removeClass('big-logo-header')
      if header.find('.small-logo-header').length < 1
        header.addClass('small-logo-header')
      if footer.find('.logo-footer').length < 1
        footer.addClass('logo-footer')
    else
      if header.find('.small-logo-header').length > 0
        header.removeClass('small-logo-header')
      if header.find('.big-logo-header').length < 1
        header.addClass('big-logo-header')
      if footer.find('.logo-footer').length > 0
        footer.removeClass('logo-footer')

App.Utilities.HeaderAndFooter = HeaderAndFooter