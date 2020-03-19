module CounterIncrement
	def increment_counter(property, id)
		obj = find(id)
		counter = obj.send(property) || 0
		obj.update_attribute(property, counter + 1)
	end
end

ActiveGraph::Node::ClassMethods.send :include, CounterIncrement