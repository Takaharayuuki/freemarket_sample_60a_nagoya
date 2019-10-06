class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :image
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.integer :buyer_id
      t.integer :seller_id
      t.timestamps
    end
  end
end