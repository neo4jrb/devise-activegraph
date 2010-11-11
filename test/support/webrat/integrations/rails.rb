require 'webrat/core/elements/form'

module Webrat
  class Form
    def self.parse_rails_request_params(params)
      Rack::Utils.parse_nested_query(params)
    end
  end
end
