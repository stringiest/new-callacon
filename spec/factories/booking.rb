# frozen_string_literal: true

FactoryBot.define do
  factory :booking, class: 'Booking' do
    association :user, factory: :basic_user
    association :event

    arrival { '15/10/2024' }
    departure { '19/10/2024' }
  end
end
