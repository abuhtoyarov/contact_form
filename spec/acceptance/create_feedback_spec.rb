require_relative 'acceptance_helper'

feature 'Create feedback', %q{
        In order to get answer a message
        As a user
        I want to be able ask questions
} do
	
	given(:user) { create(:user) }
	given!(:feedback) { create(:feedback) }

	scenario 'Admin sees order' do
		sign_in(user)
		visit feedbacks_path
		expect(page).to have_content feedback.name
	end

	scenario 'User not sees order' do
		visit feedbacks_path
		expect(page).to_not have_content feedback.name
	end


end
