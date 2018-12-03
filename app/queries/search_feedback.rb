# frozen_string_literal: true

class SearchFeedback
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    return @initial_scope.text_search(params[:q]) if params[:q].present?

    @initial_scope
  end
end
