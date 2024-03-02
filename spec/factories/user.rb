# frozen_string_literal: true

FactoryBot.define do
  factory :basic_user, class: 'User' do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |i| "user-#{i}@email.com" }
    password { 'test1234' }
  end
end
