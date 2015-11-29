# encoding: UTF-8
require "bundler/gem_tasks"
require 'rake/testtask'
require 'rdoc/task'
begin
  require 'neo4j/rake_tasks'
rescue LoadError
  load 'neo4j/tasks/neo4j_server.rake'
end

task :default => [:test, :"neo4j:db:remove"]

ENV['DEVISE_ORM'] = 'neo4j'
devise_checked_out = File.join(File.dirname(__FILE__), '../devise')
ENV['DEVISE_PATH'] =  File.exist?(devise_checked_out) ? devise_checked_out : `bundle show devise`.chomp
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
  test.verbose = true
end


namespace :neo4j do
  namespace :db do
    desc 'Remove the neo4j db files'
    task :remove do
      system "rm -fr #{File.join(File.dirname(__FILE__), "db", "*")}"
    end
  end
end
