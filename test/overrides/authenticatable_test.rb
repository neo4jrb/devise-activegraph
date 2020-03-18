require 'test_helper'
require 'integration/authenticatable_test'

class AuthenticationOthersTest < Devise::IntegrationTest
  undef :test_sign_in_stub_in_xml_format
  test 'sign in stub in xml format' do
    get new_user_session_path(:format => 'xml')
    assert_match '<?xml version="1.0" encoding="UTF-8"?>', response.body
    assert_match /<user>.*<\/user>/m, response.body
    assert_match '<email></email>', response.body
    # slight/lame format different in XML.
    #assert_match '<password nil="true"/></password>', response.body
    assert_match '<password nil="true"/>', response.body
  end
end
