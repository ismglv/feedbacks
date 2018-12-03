# frozen_string_literal: true

class FeedbackNotificationMailer < ApplicationMailer
  def send_notification(feedback)
    @feedback = feedback
    mail(to: 'admin@example.com', subject: "From #{feedback.email}, #{feedback.name}").deliver
  end
end
