class NotifyCommentJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ActionCable.server.broadcast \
      "topic_#{comment.topic_id}", { from: comment.user.nickname, comment: comment.body }
  end
end
