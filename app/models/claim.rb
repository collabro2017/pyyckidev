class Claim < ActiveRecord::Base

  attr_accessor :code_confirm

  belongs_to :office
  belongs_to :user

  validates :office, :user, presence: true

  before_create :generate_code
  after_create :notify_office
  after_save :mark_office_claimed, if: :just_claimed?
  after_save :make_user_employee, if: :just_claimed?
  before_destroy :remove_office_claim, if: :office_claimed?

  delegate :claimed?, to: :office, prefix: true

  def code_confirm=(code_string)
    self.successful = true if code_string.try(:strip).eql? code
  end

  def just_claimed?
    successful_changed? && successful?
  end

  def mark_notified!
    update_attribute(:notified_at, DateTime.now)
  end

  def remove_office_claim
    office.unclaim!
  end

  private

  def make_user_employee
    office.users << user
  end

  def mark_office_claimed
    office.claimed!
  end

  def notify_office
    if office.email.present?
      ClaimMailer.notify(self).deliver_now
    else
      AdminMailer.claim_no_office(self).deliver_now
    end
  end

  def generate_code
    self.code = SecureRandom.urlsafe_base64(4).upcase
  end
end
