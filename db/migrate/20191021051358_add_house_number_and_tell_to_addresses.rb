class AddHouseNumberAndTellToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :house_number, :string
    add_column :addresses, :tell, :string
  end
end
