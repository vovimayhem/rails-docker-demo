class NotifyNewTopicJob < ApplicationJob
  queue_as :default

  def perform(topic)
    ActionCable.server.broadcast(
      "web_notifications",
      {
        title: "New topic!",
        body: "#{topic.user.nickname} posted a new topic: '#{topic.title}'"
      }
    )
  end
end
