class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.belongs_to :user
      t.belongs_to :establishment
      t.integer :rate_value, null: false, default: 0

      t.timestamps
    end
    add_index(:rates, [:user_id, :establishment_id], unique: true)
  end
end
