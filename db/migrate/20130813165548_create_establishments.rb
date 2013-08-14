class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.belongs_to :user
      t.string :name
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.string :phone, null: false
      t.string :schedule, null: false
      t.integer :points, default: 0

      t.timestamps
    end
    add_index(:establishments, :points)
  end
end
