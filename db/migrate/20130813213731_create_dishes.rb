class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.float :price, null: false, default: 0

      t.timestamps
    end
  end
end
