# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email FFaker::Internet.unique.email
  end
end
