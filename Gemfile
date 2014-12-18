source "http://rubygems.org"

gemspec

gem "rails", "~> 4.1.1"
gem "omniauth"
gem "omniauth-oauth2"
gem "rdoc"

gem 'neo4j', :git => 'https://github.com/neo4jrb/neo4j.git'
gem 'neo4j-core', :git => 'https://github.com/neo4jrb/neo4j-core.git'
gem "devise", '3.3.0'

group :test do
  gem "omniauth-facebook"
  gem "omniauth-openid", "~> 1.0.1"
  gem "webrat", "0.7.2", :require => false
  gem "mocha", :require => false

  platforms :mri_18 do
    gem "ruby-debug", ">= 0.10.3"
  end
end

platforms :jruby do
  gem "jruby-openssl"
end

platforms :ruby do
  gem "sqlite3"

  group :mongoid do
    gem "mongo"
    gem "mongoid"
    gem "bson_ext", "~> 1.3.0"
  end
end
