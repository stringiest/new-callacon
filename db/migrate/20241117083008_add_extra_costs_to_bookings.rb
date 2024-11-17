class AddExtraCostsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :cancellable, :boolean
    add_column :bookings, :assistance_donate, :integer
    add_column :bookings, :assistance_claim, :boolean
    add_column :bookings, :single_person, :boolean
    add_column :bookings, :dog, :integer
  end
end
