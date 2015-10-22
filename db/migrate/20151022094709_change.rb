class Change < ActiveRecord::Migration
  def change
    rename_column :recipes, :cef_id, :chef_id
  end
end
