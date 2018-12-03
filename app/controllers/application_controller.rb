# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    return admin_feedbacks_path if resource.is_a? Admin

    new_feedback_path
  end
end
