source "http://rubygems.org"

group :neo4j do
  # I'll hide all the other gems in here too, so I can control the jeweler-generated gemspec a bit more easily
  gem "rails", "3.0.4"
  gem "oa-oauth", "~> 0.2.0", :require => "omniauth/oauth"
  gem "oa-openid", "~> 0.2.0", :require => "omniauth/openid"

  gem "devise", "1.3.4"  
  
  #gem "neo4j", "1.1.0"
  # Some fixes were required to get 1.1.0 totally working with devise-neo4j.  Will look to get them pulled into the next
  # gem release and will then update this gem
  gem "neo4j", :git => "git://github.com/benjackson/neo4j.git", :branch => "fixes-for-devise-gem"
end

group :test do
  gem "webrat", "0.7.2", :require => false
  gem "mocha", :require => false
end

group :development, :test do
  gem "jeweler", :require => false
  gem "ruby-debug", ">= 0.10.3" if RUBY_VERSION < '1.9'
end
