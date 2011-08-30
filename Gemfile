source "http://rubygems.org"

group :neo4j do
  # I'll hide all the other gems in here too, so I can control the jeweler-generated gemspec a bit more easily
  gem "rails", "3.1.0.rc8"
  gem "oa-oauth", "~> 0.2.0", :require => "omniauth/oauth"
  gem "oa-openid", "~> 0.2.0", :require => "omniauth/openid"
  gem "devise", "~> 1.4.3"  
  gem "neo4j", "~> 1.1.1"
end

group :test do
  gem "webrat", "0.7.2", :require => false
  gem "mocha", :require => false
end

group :development, :test do
  gem "jeweler", :require => false
  gem "ruby-debug", ">= 0.10.3" if RUBY_VERSION < '1.9'
end
