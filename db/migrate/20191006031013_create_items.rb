class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.integer :price
      t.string :size
      t.string :condition
      t.integer :delivary_fee
      t.string :shipping_method
      t.string :indication
      t.text :description
      t.integer :user_id, foreign_key: true
      t.integer :item_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
