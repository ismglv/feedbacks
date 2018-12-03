# frozen_string_literal: true

class FeedbackProcessor
  include Interactor::Organizer

  organize CreateFeedback, SendNotification
end
