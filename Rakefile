# encoding: UTF-8
require "bundler/gem_tasks"
require 'rake/testtask'
require 'rdoc/task'
begin
  require 'neo4j/rake_tasks'
rescue LoadError
  load 'neo4j/tasks/neo4j_server.rake'
end

ENV['DEVISE_ORM'] = 'active_graph'
ENV['DEVISE_PATH'] = File.join(File.dirname(__FILE__), '../devise')
desc 'Run tests for devise-neo4j.'
Rake::TestTask.new(:test) do |test|
  unless File.exist?(ENV['DEVISE_PATH'])
    puts "Specify the path to devise (e.g. rake DEVISE_PATH=/path/to/devise) or include it in your gem bundle. Not found at #{ENV['DEVISE_PATH']}"
    exit
  end
  test.libs << 'lib'
  test.libs << 'test'
  test.libs << "#{ENV['DEVISE_PATH']}/lib"
  test.libs << "#{ENV['DEVISE_PATH']}/test"

  if devise_test_path = ENV['DEVISE_TEST_PATH']
    test.test_files = FileList["#{ENV['DEVISE_PATH']}/test/#{devise_test_path}"]
  else
    test.test_files = FileList["#{ENV['DEVISE_PATH']}/test/**/*_test.rb"]  +  FileList['test/**/*_test.rb']
  end
  #test.test_files = ['test/generators/active_graph/devise_generator_test.rb']
  #test.test_files = ['test/overrides/authenticatable_test.rb']
  #test.verbose = true
  test.warning = false
end

task :default => [:test]
