require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    get :index
  end
  
  test "should have an index page" do
    assert_response :success
    assert_template 'index'
  end
  
  test "should find the correct product" do
    assert_equal @scrumspace, assigns(:product)
  end
  
  test "should find the products features" do
    assert_equal @scrumspace.features, assigns(:features)
  end
end

class CreateControllerTest < ActionController::TestCase
  tests FeaturesController
  
  # should accept feature attributes
  # should only accept post requests
  # should redirect back to product backlog
end

# NewControllerTest
# DeleteControllerTest
