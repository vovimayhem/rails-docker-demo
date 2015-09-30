class Person < ActiveRecord::Base
  validates :name, presence: true
  after_create { |person| LogPersonJob.perform_later person }
end
