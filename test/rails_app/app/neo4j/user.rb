class User < Neo4j::Rails::Model
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :registerable, :rememberable, :timeoutable, :token_authenticatable,
         :trackable, :validatable, :omniauthable
   
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
end
