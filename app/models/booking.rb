# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :arrival, :departure, presence: true
end
