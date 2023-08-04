require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Server
  class Application < Rails::Application
    config.load_defaults 7.0
    config.autoload_paths += %W[#{config.root}/lib/services]
    config.time_zone = 'America/Argentina/Buenos_Aires'
    config.active_record.default_timezone = :local
    config.api_only = true
    config.allowed_cors_origins = '*'
  end
end
