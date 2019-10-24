class RemoveColumnCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :path, :string
    remove_column :categories, :category, :string
  end
end
