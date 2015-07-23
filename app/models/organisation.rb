class Organisation < ActiveRecord::Base
  #http://stackoverflow.com/questions/16771503/how-to-join-mutli-role-multi-organisation-tables-in-rails
  has_many :memberships

  #has_many :users
  has_many :users, through: :memberships
  has_many :products

  def to_s
    name
  end

end
