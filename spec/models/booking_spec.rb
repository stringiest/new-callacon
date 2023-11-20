# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:user) { FactoryBot.build(:basic_user) }
  let(:booking) { FactoryBot.build(:booking) }

  context 'valid booking' do
    it 'should be valid with arrival and departure dates' do
      expect(booking).to be_valid
    end
  end

  context 'invalid booking' do
    it 'should not be valid without arrival date' do
      booking.arrival = nil
      expect(booking).not_to be_valid
    end

    it 'should not be valid without departure date' do
      booking.departure = nil
      expect(booking).not_to be_valid
    end
  end
end
