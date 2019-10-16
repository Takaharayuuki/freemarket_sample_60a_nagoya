class RemoveTelFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Tel, :integer
  end
end
