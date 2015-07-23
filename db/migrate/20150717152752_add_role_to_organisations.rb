class AddRoleToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :role, :integer
  end
end
