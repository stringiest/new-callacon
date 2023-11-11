# frozen_string_literal: true

# Base class for all mailers in the app
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
