class Product < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :organisation
  accepts_nested_attributes_for :product_category
end
