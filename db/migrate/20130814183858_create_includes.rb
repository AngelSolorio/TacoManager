class CreateIncludes < ActiveRecord::Migration
  def change
    create_table :includes do |t|
      t.belongs_to :dish
      t.belongs_to :order
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
    add_index(:includes, [:dish_id, :order_id], unique: true)
  end
end
