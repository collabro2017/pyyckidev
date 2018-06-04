class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    if @user.doctor?
      redirect_to doctor_path(@user), status: 301
    else
      redirect_to patient_path(@user), status: 301
    end
  end
end
