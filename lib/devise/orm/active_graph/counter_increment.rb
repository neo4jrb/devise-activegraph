module Devise
  module Orm
    module ActiveGraph
      module CounterIncrement
        def increment_counter(property, id)
          query_proxy = where(id: id)
          node_var = query_proxy.identity
          query_proxy.query
                     .set_props("#{node_var}.failed_attempts = #{node_var}.failed_attempts + 1")
                     .exec
        end
      end
    end
  end
end
