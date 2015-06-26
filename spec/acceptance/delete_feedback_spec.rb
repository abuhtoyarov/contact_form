require_relative 'acceptance_helper'

feature 'Delete feedback', %q{
        In order to delete old a feedback
        As a admin
        I want to be able delete feedback
} do
	
	given(:user) { create(:user) }
	given!(:feedback) { create(:feedback) }

	scenario 'Admin sees order' do
		sign_in(user)
		visit feedbacks_path
		
		expect(page).to have_content feedback.name
		
		click_on 'Delete'

		expect(page).to_not have_content feedback.name
		expect(page).to have_content "Feedback was successfully destroyed."
	end

	scenario 'User not sees order' do
		visit feedbacks_path
		
		expect(page).to_not have_content feedback.name
	end
end
