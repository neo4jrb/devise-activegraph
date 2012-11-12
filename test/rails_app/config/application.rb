APP_ROOT = File.expand_path("#{DEVISE_PATH}/test/rails_app")
require "#{APP_ROOT}/config/boot"

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

Bundler.require :default, DEVISE_ORM

begin
  require "#{DEVISE_ORM}/railtie"
rescue LoadError
end

require "devise"


require "tmpdir"

module RailsApp
  class Application < Rails::Application
    # Add additional load paths for your own custom dirs
    config.root = APP_ROOT
    config.autoload_paths.reject!{ |p| p =~ /\/app\/(\w+)$/ && !%w(controllers helpers views).include?($1) }
    config.autoload_paths += [  File.expand_path("#{File.dirname(__FILE__)}/../app/#{DEVISE_ORM}") ]

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters << :password

    config.action_mailer.default_url_options = { :host => "localhost:3000" }
    
    #neo4j defaults
    config.paths["log"] = File.join(Dir.tmpdir, 'devise-neo4j-tests', 'rails_app', 'log', 'test.log')
    config.neo4j.storage_path = File.join(File.dirname(__FILE__), '..', "..", "..", "db")

   
  end
end
