class InsurancePlan < ActiveRecord::Base
  belongs_to :insurance_carrier
  has_many :accepted_plans
  has_many :offices, through: :accepted_plans

  validates :name, presence: true

  def to_s
  	name
  end

  def full_name
  	"#{insurance_carrier} - #{self}"
  end
end