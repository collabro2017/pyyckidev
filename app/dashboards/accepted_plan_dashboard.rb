require "administrate/base_dashboard"

class AcceptedPlanDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    office: Field::BelongsTo,
    insurance_plan: Field::BelongsTo,
    insurance_carrier: Field::HasOne,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :office,
    :insurance_plan,
    :insurance_carrier,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :office,
    :insurance_plan,
    :insurance_carrier,
    :id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :office,
    :insurance_plan,
  ].freeze

  # Overwrite this method to customize how accepted plans are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(accepted_plan)
    "AcceptedPlan ##{accepted_plan.id}"
  end
end
