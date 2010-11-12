APP_ROOT = File.expand_path("#{DEVISE_PATH}/test/rails_app")
require "#{APP_ROOT}/config/boot"

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

Bundler.require :default
require 'ruby-debug'

begin
  require "#{DEVISE_ORM}/railtie"
rescue LoadError
end

require "devise"

module RailsApp
  class Application < Rails::Application
    # Add additional load paths for your own custom dirs
    config.root = APP_ROOT
    config.autoload_paths.reject!{ |p| p =~ /\/app\/(\w+)$/ && !%w(controllers helpers views).include?($1) }
    config.autoload_paths += [  File.expand_path("#{File.dirname(__FILE__)}/../app/#{DEVISE_ORM}") ]

    # add custom views for this ORM
    config.paths.app.views = File.expand_path("#{File.dirname(__FILE__)}/../app/#{DEVISE_ORM}/views")

    # Configure generators values. Many other options are available, be sure to check the documentation.
    # config.generators do |g|
    #   g.orm             :active_record
    #   g.template_engine :erb
    #   g.test_framework  :test_unit, :fixture => true
    # end

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters << :password

    config.action_mailer.default_url_options = { :host => "localhost:3000" }
    
    config.active_support.deprecation = :stderr
    config.paths.log = File.join(File.dirname(__FILE__), '..', 'log', 'test.log')
  end
end
