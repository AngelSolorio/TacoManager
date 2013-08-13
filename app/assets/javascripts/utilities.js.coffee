class HeaderAndFooter
  constructor: ->
    if ($('.signout-link').length > 0)
      $('#logo-header').removeClass('big-logo-header')
      $('#logo-header').addClass('small-logo-header')
    else
      $('#logo-header').removeClass('small-logo-header')
      $('#logo-header').addClass('big-logo-header')

App.Utilities.HeaderAndFooter = HeaderAndFooter