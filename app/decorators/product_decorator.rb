# coding: utf-8
module ProductDecorator
  def editable_fields
    Pundit.policy(current_user, self).permitted_attributes
  end

  def SKU
    if Pundit.policy(current_user,Product).readible_fields.include? :SKU
      product.SKU
    else
      "you don't have permission"
    end
  end

end
