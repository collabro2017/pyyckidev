class Address < ActiveRecord::Base
  include SharedValidationConstants
  geocoded_by :geocode_address

  # belongs_to :addressable, polymorphic: true
  belongs_to :office

  validates :city, presence: true
  validates :state, presence: true, inclusion: {
      in: STATES_LIST,
      message: 'must be a two letter state abbreviation such as CA for California'
    }

  validates :office, presence: true

  after_validation :geocode #, if: :full_address_changed? ## TODO write full_address_changed? to limit geocoding frequency

  delegate :name, to: :office

  def geocode_address
    [street1, city, state, zip_code].delete_if(&:blank?).join(', ')
  end

  def full_address
    [street1, street2, city, state, zip_code].delete_if(&:blank?).join(', ')
  end

  def full_street
    [street1, street2].delete_if(&:blank?).join(', ')
  end

  def city_state_zip
    [city, state, zip_code].delete_if(&:blank?).join(', ')
  end

  def coordinates
    [latitude, longitude]
  end
end
