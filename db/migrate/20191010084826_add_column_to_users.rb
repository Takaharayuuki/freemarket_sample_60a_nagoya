class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :reading, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
  end
end
