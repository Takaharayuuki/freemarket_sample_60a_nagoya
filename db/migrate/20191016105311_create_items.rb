class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.integer :price
      t.string :size
      t.string :condition
      t.integer :delivery_fee
      t.string :shipping_method
      t.string :indication
      t.string :burden
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
