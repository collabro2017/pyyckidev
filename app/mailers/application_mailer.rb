class ApplicationMailer < ActionMailer::Base
  include AbstractController::Callbacks

  default from: "info@pycky.com"
  layout 'mailer'
end
