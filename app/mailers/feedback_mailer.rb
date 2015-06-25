class FeedbackMailer < ApplicationMailer
	default from: "buhtoyarov1986@gmail.com"

	def send_mail(name, email, body)
		@name = name
		@email = email
		@body = body

		mail(to: @email, subject: 'Answer on feedback')
	end

	def send_feeback(feedback)
		@name = feedback.name
		@body = feedback.message

		if feedback.file.file
			attachments[feedback.file.file.identifier] = File.read(feedback.file.current_path)
		end

		mail(to: "users1100@mail.ru", subject: 'Feedback')
	end
end
