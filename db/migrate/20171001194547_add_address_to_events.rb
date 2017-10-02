class AddAddressToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :address, :string
  end
end
