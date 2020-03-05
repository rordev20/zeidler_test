class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name,                   limit: 100, null: false
      t.string :last_name,                   limit: 100, null: false
      t.string :email,                   limit: 100, null: false
      t.string :password_digest
      t.integer :age
      t.integer :gender
      t.references :country, null: false, foreign_key: true
      t.boolean :is_active,    null: false, default: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :users, :age, where: "deleted_at IS NULL"
    add_index :users, :gender, where: "deleted_at IS NULL"
    add_index :users, :deleted_at
  end
end
