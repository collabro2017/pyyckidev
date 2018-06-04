class ClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_claim, only: [:show, :update]
  before_action :define_office
  before_action :redirect_to_office, if: proc { @office.claimed? }

  def show
  end

  def update
    if @claim.update_attributes(confirm_params) && @claim.successful?
      redirect_to office_path(@office), notice: "You've claimed this office and can now update its conents, invite additional members, and more."
    else
      redirect_to office_claim_path(params[:office_id], @claim), notice: "Confirmation does not match the code emailed to the office"
    end
  end

  def create
    @claim = Claim.new(claim_params)
    if @claim.save
      redirect_to office_claim_path(@office, @claim)
    elsif claim_params[:office_id]
      render office_path(@office), notice: @claim.errors.full_messages
    else
      redirect_to offices_path, noice: "We didn't recognize that office"
    end
  end

  private

  def define_claim
    @claim = Claim.find(params[:id])
  end

  def define_office
    @office = @claim.present? ? @claim.office : Office.find(params[:office_id])
  end

  def redirect_to_office
    redirect_to office_path(@office)
  end

  def claim_params
    params.permit(:user_id, :office_id, :code_confirm)
  end

  def confirm_params
    params.require(:claim).permit(:code_confirm)
  end
end
