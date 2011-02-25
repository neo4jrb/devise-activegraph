require 'shared_user'

class User < Neo4j::Rails::Model
  include Shim
  include SharedUser

  index      :username
  property   :username
  
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
end
