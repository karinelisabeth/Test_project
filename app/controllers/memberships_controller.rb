class MembershipsController < ApplicationController
  before_action :find_organisation, except: [:activate]
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = @organisation.memberships.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = @organisation.memberships.new
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = @organisation.memberships.new(membership_params)

    respond_to do |format|
      if @membership.save
        InvitationMailer.invitation_email(@membership).deliver_now
        format.html { redirect_to [@organisation, @membership], notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to [@organisation, @membership], notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    @membership = Membership.where(invitation_code: params[:invitation_code]).first
    if @membership.activated?
      flash[:error] = "no you cant do this"
      redirect_to "/"
    else
      @membership.activate!
      flash[:success] = "Now you are member of #{@membership.organisation}"
      redirect_to organisation_path(@membership.organisation)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def find_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_membership
      @membership = @organisation.memberships.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:email, :role)
    end

end
