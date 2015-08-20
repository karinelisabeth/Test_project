class ChangeRoleInMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :role_id, :integer
    remove_column :memberships, :role
  end
end
