class AdminMailer < ApplicationMailer

  def claim_no_office(claim)
    @office = claim.office
    @user   = claim.user
    @claim  = claim
    @title  = "No email for #{@office} to initiate #{@user} claim"
    mail(to: 'info@pycky.com', subject: @title)
  end
end
