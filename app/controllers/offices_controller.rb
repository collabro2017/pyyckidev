class OfficesController < ApplicationController
  before_action :authenticate_user!, only: [:claim, :new]

  def index
    @offices = Office.all ## TODO update with search when supported
  end

  def edit
    @office = Office.friendly.find(params[:id])
  end

  def show
    @office = Office.includes(:address, :users, :reviews).friendly.find(params[:id])
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    if @office.save
      redirect_to office_path(@office), notice: 'Office created! If this is your office. Start the claim process now!'
    else
      render new_office_path(@office), notice: @office.errors.full_messages
    end
  end

  def update
    @office = Office.friendly.find(params[:id])
    if @office.update_attributes(office_params)
      redirect_to office_path(@office), notice: 'Office updated!'
    else
      render edit_office_path(@office), notice: @office.errors.full_messages
    end
  end

  def claim
    @office = Office.friendly.find(params[:id])
  end

  private

  def office_params
    params.require(:office).permit(
      :name, :phone, :email, :services_description, :awards_description, :yelp_url,
      { address: [:id, :street1, :street2, :city, :state, :zip_code, :addressable_type] }
    )
  end
end
