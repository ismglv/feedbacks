# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    name FFaker::Name.name
    email FFaker::Internet.unique.email
    text FFaker::Lorem.sentence
  end
end
