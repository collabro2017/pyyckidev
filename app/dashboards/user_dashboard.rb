require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
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

  COLLECTION_ATTRIBUTES = [
    :id,
    :slug,
    :first_name,
    :last_name,
    :email,
    :type,
  ].freeze

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

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.type} ##{user.name}"
  end
end
