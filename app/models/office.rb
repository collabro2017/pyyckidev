class Office < ActiveRecord::Base
  include SharedValidations
  include SharedPhonable
  include Searchable
  extend FriendlyId
  friendly_id :name, use: :slugged

  ADDRESS_ATTRS = [:street1, :street2, :city, :state, :zip_code]
  YELP_ATTRS = [:yelp_url]

  attr_accessor *(ADDRESS_ATTRS + YELP_ATTRS)

  has_one :address, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :users, through: :employees
  has_many :reviews, dependent: :destroy
  has_many :accepted_plans, dependent: :destroy
  has_many :insurance_plans, through: :accepted_plans
  has_one :yelp_account, dependent: :destroy

  mount_uploader :banner, ::BannerUploader

  scope :location, -> (location_string) { joins(:address).merge(Address.near(location_string, 10)) }
  scope :by_plan, -> (plan_id) { joins(:insurance_plans).where(insurance_plans: { id: plan_id }) }

  before_save :set_address, if: proc { :address_params_present? && address.nil? }

  validates :name, presence: true

  delegate :external_id, to: :yelp_account, prefix: true
  alias_method :primary_address, :address

  def to_s
    name
  end

  def claimed!
    update_attribute(:claimed, true)
  end

  def unclaim!
    update_attribute(:claimed, false)
  end

  def has_user?(user)
    users.include? user
  end

  def yelp_url
    yelp_account.try(:url)
  end

  def yelp_url=(url_string)
    puts 'In yelp url'
    if yelp_account.present?
      yelp_account.url = url_string
    else
      puts '*'*50
      puts url_string
      self.build_yelp_account(url: url_string)
    end
  end

  def address=(params)
    if params[:id]
      address = Address.find(params.delete(:id))
      address.update_attributes(params)
    else
      self.create_address(params)
    end
  end

  def address_params_present?
    ADDRESS_ATTRS.any? { |attribute| self.send(attribute).present? }
  end

  private

  def set_address
    self.address = ADDRESS_ATTRS.map{ |attribute| [attribute, self.send(attribute)] }.to_h
  end

  def seeded
    false
  end

end
