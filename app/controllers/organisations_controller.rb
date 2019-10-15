class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :new, :edit, :update, :destroy]

  def index
    @organisations = Organisation.all if current_user.nil?
  end

  def show
    @shifts = Shift.where("organisation_id = #{@organisation.id}")
    @shift = Shift.new
  end

  def new
    @organisation = Organisation.new
    current_user.organisation = @organisation
  end

  def edit
  end

  def create
    @organisation = Organisation.new(organisation_params)
    current_user.organisation = @organisation
    if @organisation.save
      redirect_to organisation_path(@organisation)
    else
      @organisation = Organisation.new(organisation_params)
      redirect_to organisations_path
    end
  end

  def update
    @organisation.update(organisation_params)
    redirect_to organisation_path(@organisation)
  end

  def destroy
    @organisation.destroy
    redirect_to root_path
  end

  def join
    @organisation = Organisation.find params[:id]
    current_user.update_attribute(:organisation_id, @organisation.id)
    redirect_to @organisation
  end

  def leave
    @organisation = Organisation.find params[:id]
    current_user.update_attribute(:organisation_id, nil)
    redirect_to root_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def set_organisation
    @organisation = Organisation.find(current_user.organisation_id)
  end
end
