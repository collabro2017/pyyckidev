require "administrate/base_dashboard"

class OfficeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    phone: Field::String,
    email: Field::String,
    services_description: Field::Text,
    awards_description: Field::Text,
    claimed: Field::Boolean,
    slug: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    banner: CarrierwaveField,
    address: Field::HasOne,
    accepted_plans: Field::HasMany,
    street1: Field::String,
    street2: Field::String,
    city: Field::String,
    state: Field::String,
    zip_code: Field::String,
    yelp_url: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :slug,
    :phone,
    :email,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :email,
    :phone,
    :services_description,
    :awards_description,
    :claimed,
    :slug,
    :banner,
    :yelp_url,
    :address,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :phone,
    :email,
    :services_description,
    :awards_description,
    :claimed,
    :banner,
    :yelp_url,
    :address,
    :accepted_plans,
  ].freeze

  # Overwrite this method to customize how offices are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(office)
    "#{office.name}"
  end
end
