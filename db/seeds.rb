# frozen_string_literal: true

Admin.create!(email: 'admin@example.com', password: 'password')
User.create!(email: 'john@example.com', name: 'John Smith', password: 'password')

100.times do
  Feedback.create(name: FFaker::Name.unique.name,
                  email: FFaker::Internet.unique.email,
                  text: FFaker::Lorem.unique.sentence)
end
