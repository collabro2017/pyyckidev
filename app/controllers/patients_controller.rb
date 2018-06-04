class PatientsController < ApplicationController
  def show
    @patient = Patient.friendly.find(params[:id])
  end
end
