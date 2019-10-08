class DropTableEvalition < ActiveRecord::Migration[5.2]
  def change
    drop_table :evalutions
  end
end
