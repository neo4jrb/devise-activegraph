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

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("warden", ">= 1.2.1")
  s.add_dependency("orm_adapter", "~> 0.5.0")
  s.add_dependency("bcrypt", ">= 3.0")
  s.add_dependency("railties", ">= 4.2")
  s.add_dependency("neo4j", ">= 3.0.0")
  s.add_dependency("devise", ">= 3.5.2")

end
