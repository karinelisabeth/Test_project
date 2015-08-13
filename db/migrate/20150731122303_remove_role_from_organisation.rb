class RemoveRoleFromOrganisation < ActiveRecord::Migration
  def change
    remove_column :organisations, :role, :integer
  end
end
