class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :exhibiting
      t.string :during_trading
      t.string :sold

      t.timestamps
    end
  end
end
