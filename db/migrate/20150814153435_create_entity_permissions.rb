class CreateEntityPermissions < ActiveRecord::Migration
  def change
    create_table :entity_permissions do |t|
      t.references :role, index: true
      t.string :entity
      t.boolean :c
      t.boolean :r
      t.boolean :u
      t.boolean :d

      t.timestamps null: false
    end
    add_foreign_key :entity_permissions, :roles
  end
end
