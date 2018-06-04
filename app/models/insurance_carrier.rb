class InsuranceCarrier < ActiveRecord::Base
  has_many :insurance_plans
  has_many :accepted_plans, through: :insurance_plans
  has_many :offices, through: :accepted_plans

  mount_uploader :logo, ::LogoUploader

  validates :name, presence: true

  def to_s
  	name
  end
end