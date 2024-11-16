class AddEventRefToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :event, null: false, foreign_key: true, type: :uuid
  end
end
