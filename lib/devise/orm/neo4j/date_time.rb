# Add DateTime#gmtime method if needed.
class DateTime
  unless method_defined?(:gmtime)
    def gmtime
      self.new_offset(0)
    end
  end
end