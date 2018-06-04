module SharedValidations
  extend ActiveSupport::Concern
  include SharedValidationConstants

  included do
    # validates :email, format: { with: VALID_EMAIL_REGEX }, unless: :seeded
    validates :phone, format: {
        with: VALID_PHONE_REGEX,
        message: 'must be a 10 digit number'
      }, allow_blank: true
  end
end