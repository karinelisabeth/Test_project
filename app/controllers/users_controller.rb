class UsersController < ApplicationController
  before_action :find_organisation
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to organisation_user_path(@organisation, @user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to organisation_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def find_organisation
    @organisation = Organisation.find(params[:organisation_id])
  end

  def set_user
    @user = @organisation.users.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  #TO_ASK how to add product_category_attributes to permitted attributes below?
  def user_params
    params.require(:user).permit(:email, :organisation_id, :role)
    #params.require(:user).permit(*policy(@user || Users).permitted_attributes)
  end

end
