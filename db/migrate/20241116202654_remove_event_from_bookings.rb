class RemoveEventFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :event, :string
  end
end
