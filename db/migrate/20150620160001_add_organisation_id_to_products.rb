class AddOrganisationIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :organisation_id, :integer
  end
end
