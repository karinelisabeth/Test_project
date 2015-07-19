class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    #TO_ASK  get too many redirect errors if a user that is not authorised to view /products (index) logs in
    redirect_to (root_path)
    # redirect_to (request.referrer || root_path)
  end

end
