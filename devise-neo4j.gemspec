# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise-neo4j/version"

Gem::Specification.new do |s|
  s.name        = "devise-neo4j"
  s.version     = Devise::Neo4j::VERSION
  s.authors     = ["Ben Jackson", "Bobby Calderwood"]
  s.email       = ["ben@lissomsolutions.com"]
  s.homepage    = "http://github.com/benjackson/devise-neo4j"
  s.summary     = %q{Devise ORM for Neo4j}
  s.description = %q{Neo4j integration with the Devise authentication framework}

  s.rubyforge_project = "devise-neo4j"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency "oa-oauth", "~> 0.2.0"
  s.add_runtime_dependency "oa-openid", "~> 0.2.0"
  s.add_runtime_dependency "neo4j", "~> 1.1"
  s.add_runtime_dependency "devise", "~> 1.3"
  
  s.add_development_dependency "rails", "~> 3.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "webrat", "0.7.2"
  s.add_development_dependency "mocha"
  s.add_development_dependency "ruby-debug", ">= 0.10.3" if RUBY_VERSION < '1.9'
end
