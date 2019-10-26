class RemoveColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand, :string, null: false
    add_column :items, :delivery_area, :string, null: false
    remove_column :items, :delivery_fee, :integer
  end
end
