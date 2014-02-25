# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.

module BoardGameRails
  class Application < Rails::Application
    I18n.enforce_available_locales = true
  end
end
BoardGameRails::Application.initialize!