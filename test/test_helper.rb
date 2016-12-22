ENV["RAILS_ENV"] = "test"
DEVISE_ORM = (ENV["DEVISE_ORM"] || :neo4).to_sym
DEVISE_PATH = ENV['DEVISE_PATH']

$:.unshift File.dirname(__FILE__)

puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"

require "rails_app/config/environment"
require "rails/test_help"
require "orm/#{DEVISE_ORM}"

I18n.load_path << "#{DEVISE_PATH}/test/support/locale/en.yml"

require 'mocha/setup'
require 'webrat'
Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false
end

Mocha::Configuration.allow(:stubbing_method_on_nil)

# Add support to load paths so we can overwrite broken webrat setup
$:.unshift "#{DEVISE_PATH}/test/support"
Dir["#{DEVISE_PATH}/test/support/**/*.rb"].each { |f| require f }

# Devise-neo4j test support
$:.unshift "#{File.dirname(__FILE__)}/support"
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# For generators
require 'rails/generators/test_case'
require 'generators/devise/install_generator'
require 'generators/devise/controllers_generator'
require 'generators/devise/views_generator'
require 'test_models'

