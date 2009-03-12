require 'test_helper'

class IndexTest < ActionController::TestCase
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

class CreateTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    post :create, :feature => {:description => 'foo'}
  end
  
  test "should create a new feature" do
    assert_equal 'foo', Feature.last.description
  end
  
  test "should return browser to product backlog" do
    assert_redirected_to features_path
  end
end

class UpdateTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    put :update, :id => @prioritise_features.id, :feature => {:description => 'foo'}
  end
  
  test "should update an existing feature" do
    assert_equal 'foo', @prioritise_features.reload.description
  end
  
  test "should return browser to product backlog" do
    assert_redirected_to features_path
  end
end

# NewControllerTest
# DeleteControllerTest
