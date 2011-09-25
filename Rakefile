require "rake/testtask"
require "bundler/gem_tasks"

desc 'Run tests for devise-neo4j.'
Rake::TestTask.new(:test) do |test|
  ENV['DEVISE_ORM'] = 'neo4j'
  ENV['DEVISE_PATH'] = `bundle show devise`.chomp
  unless File.exist?(ENV['DEVISE_PATH'])
    puts "Devise not found in gem bundle"
    exit
  end
  test.libs << ENV['GEM_HOME'] << "test"
  test.libs << "#{ENV['DEVISE_PATH']}/lib"
  test.libs << "#{ENV['DEVISE_PATH']}/test"
  test.test_files = FileList["#{ENV['DEVISE_PATH']}/test/**/*_test.rb"] + FileList['test/**/*_test.rb']
  test.verbose = true
end

task :default => :test
