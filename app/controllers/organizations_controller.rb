class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]

  def index
    @organizations = Organization.all
  end

  def show
  end

  # def new
  #   @organization = Organization.new
  # end

  # def create
  #   @organization = Organization.new(organization_params)
  #   if @organization.save
  #     redirect_to organizations_path, notice: "organization was successfully created."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @organization.update(organization_params)
  #     redirect_to @organization, notice: "organization was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @organization.destroy
  #   redirect_to root_path, notice: "organization was successfully destroyed."
  # end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :url)
  end
end
