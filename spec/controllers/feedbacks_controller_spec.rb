require_relative '../../spec/acceptance/acceptance_helper'

RSpec.describe FeedbacksController, type: :controller do
	let(:feedback) { create(:feedback) }
	
	describe 'GET #new' do
		it 'Assign a new Feedback to @feedback' do
			get :new
	  	expect(assigns(:feedback)).to be_a_new(Feedback)
	  end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saved the new feedback in the database' do
       	expect{ post :create, feedback: feedback.attributes }.to change(Feedback, :count).by(1)
    	end
		end

		context 'with invalid attributes' do
			it 'saved the new feedback in the database' do
        	expect{ post :create, feedback: attributes_for(:invalid_feedback) }.to_not change(Feedback, :count)
    	end
		end
	end

	describe 'DELETE #destroy' do		
		context 'authorization' do
			sign_in_user

			it 'Delete feedback' do
				feedback
	      expect{ delete :destroy, id: feedback.id }.to change(Feedback, :count).by(-1)
	    end
	  end
	end

	describe 'GET #show' do

    before{ get :show, id: feedback }

    it 'Assings the requested feedback to @feedback' do
      expect(assigns(:feedback)).to eq feedback
    end
    
    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
