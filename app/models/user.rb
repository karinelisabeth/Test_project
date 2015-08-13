class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #http://stackoverflow.com/questions/16771503/how-to-join-mutli-role-multi-organisation-tables-in-rails
  has_many :memberships
  has_many :organisations, through: :memberships
  has_one :roles_user
  has_one :role, through: :roles_user
  #belongs_to :organisation
  accepts_nested_attributes_for :organisations
  accepts_nested_attributes_for :role


  #enum role: {account_owner: 0, warehouse: 1, admin: 2}

  #TO_ASK
  # after_initialize :set_default_role, :if => :new_record?

  #TO_UPDATE
  # def set_default_role
  #   self.role ||= :account_owner
  # end


end
