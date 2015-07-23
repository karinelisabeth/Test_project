class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :invitation_code
      t.string :email
      t.datetime :created_at
      t.datetime :activated_at
      t.datetime :deactivated_at
      t.integer :organisation_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
