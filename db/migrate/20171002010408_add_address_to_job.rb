class AddAddressToJob < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :latitude, :float
    add_column :meetings, :longitude, :float
  end
end
