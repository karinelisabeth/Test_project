class Role < ActiveRecord::Base
  belongs_to :organisation
  has_one :product_permission
end
