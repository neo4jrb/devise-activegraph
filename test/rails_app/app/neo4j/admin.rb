require 'shared_admin'

class Admin < Neo4j::Rails::Model
  include Shim
  include SharedAdmin
  
  index     :remember_token
  property   :remember_token
end
