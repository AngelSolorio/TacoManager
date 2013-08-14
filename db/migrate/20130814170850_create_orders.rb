class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :establishment
      t.belongs_to :requisition
      t.float :cost, null:false, default: 0

      t.timestamps
    end
    add_index(:orders, [:user_id, :establishment_id, :requisition_id], unique: true)
  end
end
