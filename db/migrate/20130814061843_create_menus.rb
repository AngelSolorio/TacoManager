class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :dish
      t.belongs_to :establishment

      t.timestamps
    end
  end
end
