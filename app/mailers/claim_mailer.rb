class ClaimMailer < ApplicationMailer
  after_filter :mark_claim_notified, only: :notify

  def notify(claim)
    @office = claim.office
    @user   = claim.user
    @claim  = claim
    @title  = "#{@user} submitted a claim on Pycky for #{@office}"
    mail(to: @office.email, subject: @title)
  end

  private

  def mark_claim_notified
    @claim.mark_notified!
  end
end
