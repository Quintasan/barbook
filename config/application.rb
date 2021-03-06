# frozen_string_literal: true

require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BarBook
  class Config < Anyway::Config
    attr_config :secret_key_base,
                :database_host,
                :database_port,
                :database_user,
                :database_password,
                :database_adapter,
                :database_name
  end

  def self.config
    @config ||= Config.new
  end

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Do not generate assets, we are using Webpacker
    config.generators do |g|
      g.jb true
      g.assets false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # We use dry-validation
    config.action_controller.permit_all_parameters = true
  end
end
