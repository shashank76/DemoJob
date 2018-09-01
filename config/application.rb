require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JobPortalDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.secret_key_base = "6090cd45cfb2850f2cccdbe9d6f5fe4d8e9bc73ac39d47693d2f400c1144e2b9a5f52ea378c968febd67835e6cb28e498261249542c9078d4e06f2326e13f91c"

  end
end
