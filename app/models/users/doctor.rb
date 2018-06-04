class Doctor < User
  include Searchable

  paginates_per 20

  has_many :employees, foreign_key: :user_id
  has_many :offices, through: :employees
  has_many :addresses, through: :offices
  has_many :insurance_plans, through: :offices

  scope :location, -> (location_string) { joins(:addresses).merge(Address.near(location_string, 10)) }
  scope :by_plan, -> (plan_id) { joins(:insurance_plans).where(insurance_plans: { id: plan_id }) }

  def primary_address
    addresses.first
  end

  def primary_office
    offices.first
  end

  private

  def password_required?
    return false if seeded
    super
  end

  def email_required?
    return false if seeded
    super
  end
end