class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_date, :integer
  end
end
