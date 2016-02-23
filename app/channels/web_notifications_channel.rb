class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "web_notifications"
  end
end
