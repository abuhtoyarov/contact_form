class Feedback < ActiveRecord::Base

	include Humanizer
	attr_accessor :bypass_humanizer
	require_human_on :create, :unless => :bypass_humanizer

	validates :name, :email, :message,  presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
		 
	mount_uploader :file, ImageUploader

	after_create :send_feedback

	def send_mail(message)
		SendMailJob.perform_later(self.name, self.email, message)
	end
	
	private

	def send_feedback
		SendFeedbackJob.perform_later self
	end
end
