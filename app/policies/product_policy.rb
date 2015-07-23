
class ProductPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.account_owner?
        scope.all
      else
        scope.where(:id => 0)
      end
    end
  end


  def permitted_attributes
    if user.account_owner?
      [:product_name,  :product_category_id]
    else
      [:product_category_id]
    end
  end


  #(:product_name, :product_category_id,
  #:product_category_attributes => [:id, :cat_name]


  end