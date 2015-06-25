class SendFeedbackJob < ActiveJob::Base
  queue_as :default

  def perform(feedback)
    FeedbackMailer.send_feeback(feedback).deliver_later
  end
end
