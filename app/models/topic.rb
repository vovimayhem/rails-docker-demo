class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments

  # Notify new topic...
  after_create { |topic| NotifyNewTopicJob.perform_later topic }
end
