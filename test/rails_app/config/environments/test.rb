RailsApp::Application.configure do
	config.active_support.deprecation = :stderr
  config.paths.log = File.join(File.dirname(__FILE__), '..', '..', 'log', 'test.log')
end
