class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password_digest
      t.string :provider
      t.string :uid
      t.boolean :active, default: true

      t.timestamps
    end
    add_attachment :users, :picture
  end
end
