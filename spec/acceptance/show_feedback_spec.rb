require_relative 'acceptance_helper'

feature 'Show feedback', %q{
        In order to delete old a feedback
        As a admin
        I want to be able delete feedback
} do
	
	given(:user) { create(:user) }
	given!(:feedback) { create(:feedback) }

	scenario 'Admin show feedback' do
		sign_in(user)
		visit feedbacks_path
		
		expect(page).to have_content feedback.name
		
		click_on 'Show'

		expect(page).to have_content "Заявку написал #{feedback.name}"
		expect(page).to have_content feedback.name
		expect(page).to have_content feedback.message
		expect(page).to have_content feedback.created_at
	end
end
