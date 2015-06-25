require_relative 'acceptance_helper'

feature 'Send answer on feedback', %q{
        In order to answer on a feedback
        As a admin
        I want to be able answer on feedback
} do
	
	given(:user) { create(:user) }
	given!(:feedback) { create(:feedback) }

	scenario 'Admin sees order' do
		sign_in(user)
		visit feedback_path(feedback)

		fill_in 'message', with: 'answer'
		click_on 'Отправить сообщение.'

		expect(page).to have_content 'Send ok'
	end
end
