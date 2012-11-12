class DeviseHelperTest < ActionController::IntegrationTest
  setup :neo4j_i18n
  
  private
  def neo4j_i18n
    I18n.backend.store_translations :fr, {
      :neo4j => { :models => { :user => "utilisateur" } }
    }
  end
end