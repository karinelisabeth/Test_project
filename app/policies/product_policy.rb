
class ProductPolicy < ApplicationPolicy

  def initialize(user, product)
    @user = user
    @product = product
    @role_name = user.memberships.first.role
    @role = Role.find_by_name(@role_name)
    @permission = ProductPermission.find_by_role_id(@role)
  end

  def create?
    @permission.c?
  end

  # class Scope < Scope
  #   def resolve
  #     if user.role.name == "account_owner"
  #       if user.account_owner?
  #         scope.all
  #       else
  #         scope.where(:id => 0)
  #       end
  #     end
  #   end
  # end


  def permitted_attributes
    #if user.account_owner?
      [:product_name,  :product_category_id, :SKU]
    #else
     # [:product_category_id]
    #end
  end

end





  # --------------------------------------------------------
  # OLD
  # --------------------------------------------------------
  #(:product_name, :product_category_id,
  #:product_category_attributes => [:id, :cat_name]
  #end