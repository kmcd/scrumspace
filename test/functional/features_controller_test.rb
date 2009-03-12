require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    get :index
  end
  
  test "have an index page" do
    assert_response :success
    assert_template 'index'
  end
  
  test "should find the products features" do
    assert_equal @scrumspace.features, assigns(:features)
  end
end

class CreateControllerTest < ActionController::TestCase
  tests FeaturesController
  
  test "should create a new feature" do
    post :create, :feature => {:description => 'foo'}
    assert_equal 'foo', Feature.last.description
  end
  
  test "should return browser to product backlog" do
    post :create, :feature => {:description => 'foo'}
    assert_redirected_to features_path
  end
end

# NewControllerTest
# DeleteControllerTest
