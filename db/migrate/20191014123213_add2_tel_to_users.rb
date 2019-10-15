class Add2TelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tel, :string
  end
end
