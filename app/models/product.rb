class Product < ActiveRecord::Base
  belongs_to :product_category
  accepts_nested_attributes_for :product_category
end
