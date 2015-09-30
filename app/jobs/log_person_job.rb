class LogPersonJob < ActiveJob::Base
  queue_as :default

  def perform(person)
    puts "===== A person named '#{person.try(:name)}' was registered. ======"
  end
end
