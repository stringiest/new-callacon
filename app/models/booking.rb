# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :arrival, :departure, :cancellable, :assistance_claim, :single_person, :dog, :lark_or_owl, :massage_house,
    :late_n_loud, :chillout_house, :dog_house, :hot_tub_house, :family_room, presence: true
end
