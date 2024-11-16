# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user, :event

  validates :arrival, :departure, presence: true
end
