# coding: utf-8
module ProductDecorator
  def editable_fields
    Pundit.policy(current_user, self).permitted_attributes
  end
end
