class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :establishment

      t.timestamps
    end
    add_index(:images, :establishment_id)
    add_attachment :images, :image
  end
end
