class ChangeColumnNamesProductPermissions2 < ActiveRecord::Migration
  def change
    rename_column :product_permissions, :my_create, :c
    rename_column :product_permissions, :my_read, :r
    rename_column :product_permissions, :my_update, :u
    rename_column :product_permissions, :my_destroy, :d
  end
end
