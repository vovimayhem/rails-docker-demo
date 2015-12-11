# App.cable.subscriptions.create { channel: "ChatChannel", room: "Best Room" },
#   received: (data) ->
#     new Message data['sent_by'], body: data['body']
