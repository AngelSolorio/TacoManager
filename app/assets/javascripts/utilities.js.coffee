class HeaderAndFooter
  constructor: ->
    header = $('#logo-header')
    footer = $('#logo-footer')
    menu = $('#menu').css("display")

    if $('.signout-link').length > 0 or $('#signup-button').length > 0
      if header.find('.big-logo-header').length > 0
        header.removeClass('big-logo-header')
      if header.find('.small-logo-header').length < 1
        header.addClass('small-logo-header')
      if footer.find('.logo-footer').length < 1
        footer.addClass('logo-footer')
      if menu == "block" and $('#signup-button').length > 0
        $('#menu').css("display", "none")

    else
      if header.find('.small-logo-header').length > 0
        header.removeClass('small-logo-header')
      if header.find('.big-logo-header').length < 1
        header.addClass('big-logo-header')
      if footer.find('.logo-footer').length > 0
        footer.removeClass('logo-footer')
      if menu == "block"
        $('#menu').css("display", "none")

App.Utilities.HeaderAndFooter = HeaderAndFooter