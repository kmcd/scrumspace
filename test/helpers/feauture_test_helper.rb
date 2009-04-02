def each_feature
  @scrumspace.features.each { |f| yield f }
end

class FeatureFunctionalTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    stub_product
    get :index
  end
end
