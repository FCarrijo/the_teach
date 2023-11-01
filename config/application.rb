require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TheTeach
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.i18n.available_locales = "pt-BR"
    config.i18n.default_locale = "pt-BR"
    config.encoding = "utf-8"
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = [:en, "pt-BR"]
    config.active_record.belongs_to_required_by_default = false
    config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, ActiveSupport::TimeWithZone, ActiveSupport::TimeZone, BigDecimal]
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
