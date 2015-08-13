class AddOrganisationToRole < ActiveRecord::Migration
  def change
    add_column :roles, :organisation_id, :integer
  end
end
