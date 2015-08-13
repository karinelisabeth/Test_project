class RemoveUserIdFromRole < ActiveRecord::Migration
  def change
    remove_column :roles, :user_id, :integer
    remove_column :roles, :organisation_id, :integer
  end
end
