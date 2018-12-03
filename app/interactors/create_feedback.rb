# frozen_string_literal: true

class CreateFeedback
  include Interactor

  def call
    feedback = Feedback.new(context.to_h)
    if feedback.save
      context.feedback = feedback
    else
      context.fail!(message: feedback.errors.messages.values.join(','))
    end
  end
end
