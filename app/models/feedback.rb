# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.text_search(query)
    where('similarity(name, ?) > 0.3 or similarity(text, ?) > 0.3', query, query)
  end
end
