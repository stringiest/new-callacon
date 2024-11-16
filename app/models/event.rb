# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
end
