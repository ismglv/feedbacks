# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    result = FeedbackProcessor.(feedback_params)
    if result.success?
      redirect_to new_feedback_path, notice: 'Feedback successfully created'
    else
      render 'new'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end
end
