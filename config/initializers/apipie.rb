# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = "HopeIT"
  config.copyright               = "&copy; 2017 Przewozy Regionalne"
  config.default_version         = "1"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/api/docs"
  config.api_controllers_matcher = Rails.root.join('app', 'controllers', 'api', '**', '*.rb').to_s
  config.validate                = false
  config.markup                  = Apipie::Markup::Markdown.new
  config.show_all_examples       = true
  config.translate               = false
  config.default_locale          = nil
end
