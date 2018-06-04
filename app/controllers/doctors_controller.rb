class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.friendly.find(params[:id])
  end

  def index
  	@doctors = Doctor.search(search_params)
    @hash = Gmaps4rails.build_markers(@doctors) do |doctor, marker|
      next unless doctor.primary_address.present?
      marker.lat doctor.primary_address.latitude
      marker.lng doctor.primary_address.longitude
      marker.infowindow "<a href='#{office_path(doctor.primary_office)}'>#{doctor.name}</a>".html_safe
    end
  end

  private

  def search_params
  	params.slice(:location, :by_plan, :page)
  end
end
