require 'test_helper'

class FeaturesControllerIndexTest < ActionController::TestCase
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
  
  test "should fetch all features if no demo passed" do
    assert_equal @scrumspace.features, assigns(:features)
  end
  
  test "should fetch all features if an invalid demo passed" do
    get :index, :demo => 'Foo'
    assert_equal @scrumspace.features, assigns(:features)
  end
  
  test "should fetch features for a given demo" do
    get :index, :demo => @create_feature.demo.to_s(:db)
    assert_equal [@create_feature], assigns(:features)
  end
end

class FeaturesControllerCreateTest < ActionController::TestCase
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

class FeaturesControllerUpdateTest < ActionController::TestCase
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

class FeaturesControllerDeleteTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    post :destroy, :id => @prioritise_features.id
  end
  
  test "should create a new feature" do
    assert_raise ActiveRecord::RecordNotFound do
      Feature.find @prioritise_features.id
    end
  end
  
  test "should return browser to product backlog" do
    assert_redirected_to features_path
  end
end
