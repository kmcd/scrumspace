class FeatureFunctionalTest < ActionController::TestCase
  tests FeaturesController
  setup :activate_authlogic
  
  def setup
    login_with @keith
    get :index
  end
  
  def each_feature
    @scrumspace.features.each { |f| yield f }
  end
end
