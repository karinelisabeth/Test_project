class ChangeColumnNamesProductPermissions < ActiveRecord::Migration
  def change
    rename_column :product_permissions, :create, :my_create
    rename_column :product_permissions, :read, :my_read
    rename_column :product_permissions, :update, :my_update
    rename_column :product_permissions, :destroy, :my_destroy
  end
end
