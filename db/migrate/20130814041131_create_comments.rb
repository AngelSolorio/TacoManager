class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :establishment
      t.string :title
      t.text :description, null: false

      t.timestamps
    end
  end
end
