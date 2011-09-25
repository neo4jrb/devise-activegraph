require "rubygems"
require "bundler/setup"

ENV["RAILS_ENV"] = "test"
DEVISE_ORM = :neo4j
DEVISE_PATH = ENV['DEVISE_PATH'] || `bundle show devise`.chomp

require "neo4j"
require "orm/neo4j"
require "omniauth/oauth"
require "omniauth/openid"
require "devise"

require "rails_app/config/environment"
require "rails/test_help"

require 'mocha'
require 'webrat'

# Devise test support
$:.unshift "#{DEVISE_PATH}/test/support"
Dir["#{DEVISE_PATH}/test/support/**/*.rb"].each { |f| require f }

# Devise-neo4j test support
$:.unshift "#{File.dirname(__FILE__)}/support"
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# For generators
require "rails/generators/test_case"
require "generators/devise/install_generator"
require "generators/devise/views_generator"

Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false
end

# Add translations for devise tests
I18n.load_path << "#{DEVISE_PATH}/config/locales/en.yml"

$:.unshift File.dirname(__FILE__)
puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"
