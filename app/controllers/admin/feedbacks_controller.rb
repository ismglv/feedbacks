# frozen_string_literal: true

class Admin::FeedbacksController < Admin::AdminController
  def index
    @feedbacks = SearchFeedback.new(Feedback.all).(params).order(created_at: :desc)
    @feedbacks = @feedbacks.page(params[:page])
  end
end
