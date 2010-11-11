class Admin < Neo4j::Rails::Model
  devise :database_authenticatable, :encryptable, :registerable,
         :timeoutable, :recoverable, :rememberable, :lockable,
         :unlock_strategy => :time
end
