
class ProductPolicy < ApplicationPolicy

  def initialize(user, product)
    @user = user
    @product = product
    @role = user.memberships.where(organisation: @product.organisation).first.role
    @permission = @role.entity_permissions.where(entity: "Product").first
  end

  def index?
    @permission.r
  end

  def create?
    @permission.c
  end

  def readible_fields
    if index?       #no point in checking individual attributes if role is denied view permission on the whole table
      if @role_name == 'member'
        [:product_name,  :product_category_id]
      else
        [:product_name,  :product_category_id, :SKU]
      end
    else
      puts "you don't have permission to view products"
    end
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
    if @role_name == 'member'
      [:product_name,  :product_category_id]
    else
      [:product_name,  :product_category_id, :SKU]
    end
  end

end





  # --------------------------------------------------------
  # OLD
  # --------------------------------------------------------
  #(:product_name, :product_category_id,
  #:product_category_attributes => [:id, :cat_name]
  #end