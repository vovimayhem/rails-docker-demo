# Request notification permissions:
Notification.requestPermission() if window.Notification

# Client-side, which assumes you've already requested the right to send web notifications
App.cable.subscriptions.create "WebNotificationsChannel",
  # Called when the subscription is ready for use on the server
  connected: ->
    console.log "WebNotificationsChannel - connected"

  # Called when the WebSocket connection is closed
  disconnected: ->
    console.log "WebNotificationsChannel - disconnected"

  # Called when the subscription is rejected by the server
  rejected: ->
    console.log "WebNotificationsChannel - rejected"

  received: (data) ->
    console.log "WebNotificationsChannel", data
    new Notification data["title"], body: data["body"]
