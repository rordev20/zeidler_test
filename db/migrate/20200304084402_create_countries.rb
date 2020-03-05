class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name,          limit: 40, null: false
      t.boolean :is_active,    null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :countries, :name, where: "deleted_at IS NULL"
    add_index :countries, :deleted_at
  end
end
