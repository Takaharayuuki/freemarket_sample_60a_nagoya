class CreateEvalutions < ActiveRecord::Migration[5.2]
  def change
    create_table :evalutions do |t|
      t.string :good
      t.string :nomal
      t.string :bad
      t.timestamps
    end
  end
end
