ENV["RAILS_ENV"] = "test"
DEVISE_ORM = (ENV["DEVISE_ORM"] || :neo4j).to_sym
DEVISE_PATH = ENV['DEVISE_PATH']

$:.unshift File.dirname(__FILE__)
puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"

require "rails_app/config/environment"
require "rails/test_help"
require "orm/#{DEVISE_ORM}"
Dir["test/overrides/**/*.rb"].each { |f| require f }

require "neo4j"
I18n.load_path << "#{DEVISE_PATH}/config/locales/en.yml"

require 'mocha'
require 'webrat'
Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false
end

#Devise::OmniAuth.test_mode!

# Add support to load paths so we can overwrite broken webrat setup
$:.unshift "#{DEVISE_PATH}/test/support"
Dir["#{DEVISE_PATH}/test/support/**/*.rb"].each { |f| require f }
Dir["test/support/**/*.rb"].each { |f| require f }

