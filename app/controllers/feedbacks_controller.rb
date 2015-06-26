class FeedbacksController < ApplicationController

  before_action :load_feedback, only: [:show, :destroy, :send_mail]

  respond_to :html, :js

  authorize_resource

  def index
    respond_with(@feedback = Feedback.all)
  end

  def new
    respond_with(@feedback = Feedback.new)
  end

  def create
    respond_with(@feedback = Feedback.create(feedback_params), :location => root_path)
  end

  def show
    respond_with @feedback
  end

  def destroy
    respond_with(@feedback.destroy)
  end

  def send_mail
    @feedback.send_mail(params['message'])
    redirect_to root_path, notice: "Send ok"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message, :file, :humanizer_answer, :humanizer_question_id)
  end

  def load_feedback
    @feedback = Feedback.find(params[:id])
  end

end
