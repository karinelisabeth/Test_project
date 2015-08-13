class CreateProductPermissions < ActiveRecord::Migration
  def change
    create_table :product_permissions do |t|
      t.integer :role_id
      t.boolean :create
      t.boolean :read
      t.boolean :update
      t.boolean :destroy

      t.timestamps null: false
    end
  end
end
