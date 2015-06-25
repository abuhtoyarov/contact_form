class SendMailJob < ActiveJob::Base
  queue_as :default

  def perform(name, email, message)
    FeedbackMailer.send_mail(name, email, message).deliver_later
  end
end
