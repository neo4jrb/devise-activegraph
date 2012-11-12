class Neo4j::Rails::Model

  
  # Hack to get around the fact that Neo4j doesn't support :order (currently)
  def self.last(*args)
    if args == [{ :order => "id" }]
      last
    else
      super
    end
  end
end

         