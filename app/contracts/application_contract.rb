# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  config.messages.default_locale = :en
  config.messages.load_paths << Rails.root.join('config', 'locales', 'errors', 'en.yml')
end
