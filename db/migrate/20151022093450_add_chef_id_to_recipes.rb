class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cef_id, :integer
  end
end
