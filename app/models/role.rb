class Role < ActiveRecord::Base
  after_create :create_default_entity_permissions

  belongs_to :organisation
  has_many :entity_permissions
  has_many :memberships

  def to_s
    name
  end

  private

  def create_default_entity_permissions
    ["Product", "User"].each do |entity_name|
      self.entity_permissions.create(entity: entity_name, c: true, r: true, u: true, d: true)
    end
  end

end
