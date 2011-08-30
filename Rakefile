require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "devise-neo4j"
    gem.summary = %Q{Devise ORM for Neo4j}
    gem.description = %Q{Neo4j integration with the Devise authentication framework}
    gem.email = "ben.jackson1@gmail.com"
    gem.homepage = "http://github.com/benjackson/devise-neo4j"
    gem.authors = ["Ben Jackson", "Bobby Calderwood"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.add_dependency "neo4j", "~> 1.1"
    gem.add_dependency "devise", "~> 1.4.3"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc 'Default: run tests for all ORM setups.'
task :default => [ :set_devise_path, :pre_commit ]

task :set_devise_path do
  ENV['DEVISE_PATH'] = `bundle show devise`.chomp
end

desc 'Run Devise tests for all ORM setups.'
task :pre_commit do
  Dir[File.join(File.dirname(__FILE__), 'test', 'orm', '*.rb')].each do |file|
    orm = File.basename(file).split(".").first
    ENV['DEVISE_ORM'] ||= orm
    # system "rake test DEVISE_ORM=#{orm} DEVISE_PATH=#{ENV['DEVISE_PATH']}"
    Rake::Task["test"].reenable
    Rake::Task["test"].invoke
  end
end

desc 'Run Devise tests. Specify path to devise with DEVISE_PATH'
Rake::TestTask.new(:test) do |test|
  ENV['DEVISE_ORM'] ||= 'neo4j'
  ENV['DEVISE_PATH'] ||= `bundle show devise`.chomp
  unless File.exist?(ENV['DEVISE_PATH'])
    puts "Specify the path to devise (e.g. rake DEVISE_PATH=/path/to/devise). Not found at #{ENV['DEVISE_PATH']}"
    exit
  end
  test.libs << 'lib' << 'test'
  test.libs << "#{ENV['DEVISE_PATH']}/lib"
  test.libs << "#{ENV['DEVISE_PATH']}/test"
  test.test_files = FileList["#{ENV['DEVISE_PATH']}/test/**/*_test.rb"] + FileList['test/**/*_test.rb']
  test.verbose = true
end

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "devise-neo4j #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
