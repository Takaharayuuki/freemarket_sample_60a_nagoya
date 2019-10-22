class AddColumnCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :ancestry, :string, index: true
  end
end
