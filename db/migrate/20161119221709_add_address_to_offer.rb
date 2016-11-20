class AddAddressToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :address, :string, null: false, default: ""
    add_column :offers, :latitude, :decimal, precision: 10, scale: 6
    add_column :offers, :longitude, :decimal, precision: 10, scale: 6
  end
end
