class DeviseHelperTest < ActionDispatch::IntegrationTest
  setup :neo4j_i18n

  private
  def neo4j_i18n
    I18n.backend.store_translations :en, {
      :neo4j => { :models => { :user => "the user" } }
    }
  end
end
