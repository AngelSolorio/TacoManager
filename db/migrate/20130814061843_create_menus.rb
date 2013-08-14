class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :dish
      t.belongs_to :establishment

      t.timestamps
    end
    add_index(:menus, [:dish_id, :establishment_id], unique: true)
  end
end
