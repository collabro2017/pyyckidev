require "administrate/base_dashboard"

class AddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    street1: Field::String,
    street2: Field::String,
    city: Field::String,
    state: Field::String,
    zip_code: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    addressable_id: Field::Number,
    addressable_type: Field::String,
    addressable: Field::Polymorphic
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :street1,
    :street2,
    :city,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :street1,
    :street2,
    :city,
    :state,
    :zip_code,
    :latitude,
    :longitude,
    :addressable
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :street1,
    :street2,
    :city,
    :state,
    :zip_code,
    # :latitude,
    # :longitude
    # :addressable_type,
    # :addressable_id
  ].freeze

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(address)
    "Address ID #{address.id} - #{address.name}"
  end
end
