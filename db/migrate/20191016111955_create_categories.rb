class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :path
      t.string :category
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
