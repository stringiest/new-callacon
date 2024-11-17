class AddRequestsToBookings < ActiveRecord::Migration[7.1]
  def change
    create_enum :lark_or_owl, ["lark", "owl", "neither"]
    create_enum :massage_house, ["yes", "no", "don't mind"]
    create_enum :late_n_loud, ["yes", "no", "don't mind"]
    create_enum :chillout_house, ["yes", "no", "don't mind"]
    create_enum :hot_tub_house, ["yes", "no", "don't mind"]
    create_enum :sharing_bed, ["double", "two singles"]
    create_enum :dog_house, ["yes", "no", "don't mind"]
    
    add_column :bookings, :lark_or_owl, :enum, enum_type: :lark_or_owl, null: false
    add_column :bookings, :massage_house, :enum, enum_type: :massage_house, null: false
    add_column :bookings, :late_n_loud, :enum, enum_type: :late_n_loud, null: false
    add_column :bookings, :chillout_house, :enum, enum_type: :chillout_house, null: false
    add_column :bookings, :dog_house, :enum, enum_type: :dog_house, null: false
    add_column :bookings, :hot_tub_house, :enum, enum_type: :hot_tub_house, null: false
    add_column :bookings, :family_room, :boolean
    add_column :bookings, :sharing_with, :string
    add_column :bookings, :sharing_bed, :enum, enum_type: :sharing_bed
    add_column :bookings, :comments, :string
  end
end
