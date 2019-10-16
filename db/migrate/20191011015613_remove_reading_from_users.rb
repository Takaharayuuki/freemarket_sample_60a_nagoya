class RemoveReadingFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :reading, :string
  end
end
