class ChangeToEnum < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :cancellable, :boolean
    remove_column :bookings, :assistance_claim, :boolean
    remove_column :bookings, :single_person, :boolean
    
    create_enum :cancellable, ["yes", "no"]
    create_enum :assistance_claim, ["yes", "no"]
    create_enum :single_person, ["yes", "no"]
    
    add_column :bookings, :cancellable, :enum, enum_type: :cancellable, null: false
    add_column :bookings, :assistance_claim, :enum, enum_type: :assistance_claim, null: false
    add_column :bookings, :single_person, :enum, enum_type: :single_person, null: false
  end
end
