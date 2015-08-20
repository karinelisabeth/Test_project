class Organisation < ActiveRecord::Base
  after_create :create_default_roles

  #http://stackoverflow.com/questions/16771503/how-to-join-mutli-role-multi-organisation-tables-in-rails
  has_many :memberships
  has_many :users, through: :memberships
  has_many :products
  has_many :roles


  def to_s
    name
  end

  private

  def create_default_roles
    ["moderator", "member"].each do |name|
      self.roles.create(name: name)
    end
  end

end
