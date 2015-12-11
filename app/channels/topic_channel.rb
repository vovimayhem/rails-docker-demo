class TopicChannel < ApplicationCable::Channel
  def subscribed
    stream_from "topic_#{params[:topic_id]}"
  end
end
