# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :arrival, :departure, :cancellable, :assistance_claim, :single_person, :dog, presence: true
end
