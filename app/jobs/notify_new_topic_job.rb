class NotifyNewTopicJob < ApplicationJob
  queue_as :default

  def perform(topic)
    ActionCable.server.broadcast \
      "general", { from: topic.user.nickname, title: topic.title }
  end
end
