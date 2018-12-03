# frozen_string_literal: true

class SendNotification
  include Interactor

  def call
    FeedbackNotificationMailer.send_notification(context.feedback).deliver_now
  end
end
