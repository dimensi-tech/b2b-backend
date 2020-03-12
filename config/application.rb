require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module B2bBackend
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[
      Rails.root.join('config', 'locales', '**', '*.{rb,yml}')
    ]
    config.time_zone = 'Asia/Jakarta'
    config.i18n.default_locale = :id
    config.active_job.queue_adapter = :delayed_job
  end
end
