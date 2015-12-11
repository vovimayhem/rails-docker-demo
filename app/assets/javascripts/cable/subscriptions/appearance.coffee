App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    # Called once the subscription has been successfully completed

  rejected: ->
    # Called when the subscription is rejected by the server

  appear: ->
    @perform 'appear', appearing_on: @appearingOn()

  away: ->
    @perform 'away'

  appearingOn: ->
    $('main').data 'appearing-on'

$(document).on 'page:change', ->
  App.appearance.appear()

$(document).on 'click', '[data-behavior~=appear_away]', ->
  App.appearance.away()
  false
