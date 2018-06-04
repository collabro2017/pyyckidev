require "administrate/base_dashboard"

class DoctorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    admin: Field::Boolean,
    type: Field::String,
    slug: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    phone: Field::String,
    verified: Field::Boolean,
    services_description: Field::Text,
    awards_description: Field::Text,
    avatar: CarrierwaveField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :slug,
    :email,
    :first_name,
    :last_name,
    :verified,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :slug,
    :email,
    :admin,
    :type,
    :first_name,
    :last_name,
    :phone,
    :verified,
    :services_description,
    :awards_description,
    :avatar,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :unconfirmed_email,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :email,
    :admin,
    :type,
    :first_name,
    :last_name,
    :verified,
    :phone,
    :services_description,
    :awards_description,
    :avatar,
  ].freeze

  # Overwrite this method to customize how doctors are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(doctor)
  #   "Doctor ##{doctor.id}"
  # end
end
