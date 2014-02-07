source "http://rubygems.org"

gemspec

gem "rails", "~> 4.0"
gem "omniauth"
gem "omniauth-oauth2"
gem "rdoc"
gem 'neo4j', :git => 'https://github.com/andreasronge/neo4j.git'
gem "devise", "~> 3.0"
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
  gem "activerecord-jdbc-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
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
