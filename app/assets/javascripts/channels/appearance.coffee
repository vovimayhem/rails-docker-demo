App.cable.subscriptions.create "AppearanceChannel",
  # Called when the subscription is ready for use on the server
  connected: ->
    console.log "AppearanceChannel - connected"
    @install()
    @appear()

  # Called when the WebSocket connection is closed
  disconnected: ->
    console.log "AppearanceChannel - disconnected"
    @uninstall()

  # Called when the subscription is rejected by the server
  rejected: ->
    console.log "AppearanceChannel - rejected"
    @uninstall()

  appear: ->
    console.log "AppearanceChannel - appear"
    # Calls `AppearanceChannel#appear(data)` on the server
    @perform("appear", appearing_on: $("main").data("appearing-on"))

  away: ->
    console.log "AppearanceChannel - away"
    # Calls `AppearanceChannel#away` on the server
    @perform("away")

  buttonSelector: "[data-behavior~=appear_away]"

  install: ->
    $(document).on "page:change.appearance", =>
      @appear()

    $(document).on "click.appearance", @buttonSelector, =>
      @away()
      false

    $(@buttonSelector).show()

  uninstall: ->
    $(document).off(".appearance")
    $(@buttonSelector).hide()
