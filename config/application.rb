require File.expand_path('../boot', __FILE__)
require 'rails/all'
require 'roo'
require 'spreadsheet'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

A9n.root = File.expand_path('../..', __FILE__)
A9n.load

module Ap3
  class Application < Rails::Application
    # config.autoload_paths += %W(
    #   #{config.root}/app/services
    # )
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Warsaw'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :pl
    I18n.config.enforce_available_locales = true

    config.action_mailer.default_url_options = { host: A9n.mailer[:host] }
  end
end
