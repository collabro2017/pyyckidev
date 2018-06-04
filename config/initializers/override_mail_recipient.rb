if Rails.env.development? || Rails.env.testing?
  class OverrideMailRecipient
    def self.delivering_email(mail)
      mail.to  = ENV['TESTING_EMAIL']
      mail.bcc = ENV['TESTING_EMAIL']
    end
  end
  ActionMailer::Base.register_interceptor(OverrideMailRecipient)
end
