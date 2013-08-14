class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.float :cost, null: false, default: 0
      t.string :checktime, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
