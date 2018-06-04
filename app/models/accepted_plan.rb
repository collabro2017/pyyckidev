class AcceptedPlan < ActiveRecord::Base
  belongs_to :office
  belongs_to :insurance_plan
  has_one :insurance_carrier, through: :insurance_plan

  ## TODO make this unique; offices with more than 1 dentist right now are not
end