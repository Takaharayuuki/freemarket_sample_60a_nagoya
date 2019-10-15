class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_address
      t.string :prefecture
      t.string :city
      t.integer :house_number
      t.string :building_name
      t.integer :tel

      t.timestamps
    end
  end
end
