class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings, id: :uuid do |t|
      t.string :event
      t.date :arrival
      t.date :departure
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
