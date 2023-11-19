# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable
end
