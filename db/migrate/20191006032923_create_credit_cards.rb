class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :brand
      t.integer :number
      t.integer :expiration_date

      t.timestamps
    end
  end
end
