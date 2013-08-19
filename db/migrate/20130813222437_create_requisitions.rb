class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.belongs_to :user
      t.float :cost, null: false, default: 0
      t.time :checktime, null: false, default: Time.now + 1.hour
      t.string :status, null: false

      t.timestamps
    end
    add_index(:requisitions, :user_id)
  end
end
