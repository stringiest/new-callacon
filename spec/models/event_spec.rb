# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryBot.build(:event) }

  context 'valid event' do
    it 'should be valid with name' do
      expect(event).to be_valid
    end
  end

  context 'invalid event' do
    it 'should not be valid without name' do
      event.name = nil
      expect(event).not_to be_valid
    end
  end
end
