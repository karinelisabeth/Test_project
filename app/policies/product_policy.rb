class ProductPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @product = model
  end

  def permitted_attributes
    puts "permitted"
    if @current_user.account_owner?
      [:product_name,  :product_category_id]
    else
      [:product_category_id]
    end
  end

  #(:product_name, :product_category_id,
  #:product_category_attributes => [:id, :cat_name]


  end