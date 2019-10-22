class RemoveHouseNumberFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :house_number, :integer
    remove_column :addresses, :tel, :integer
  end
end
