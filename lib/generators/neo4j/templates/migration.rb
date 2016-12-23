class DeviseCreateUserConstraintsAndIndexes < Neo4j::Migrations::Base
  def change
    add_index :<%= table_name %>, :email, force: true
    add_index :<%= table_name %>, :remember_token, force: true
    add_index :<%= table_name %>, :reset_password_token, force: true
    # add_index :<%= table_name %>, :confirmation_token, force: true
    # add_index :<%= table_name %>, :unlock_token, force: true
    # add_index :<%= table_name %>, :authentication_token, force: true
  end
end
