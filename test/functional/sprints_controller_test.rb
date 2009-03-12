require 'test_helper'

class SprintsControllerTest < ActionController::TestCase
  def setup
    get :show, :id => @prioritise_features.demo.to_s(:db)
  end
  
  test "should have all features for demo" do
    assert_equal [@prioritise_features], assigns(:features)
  end
  
  test "should use the features tempate" do
    assert_response :success
    assert_template 'features/index'
  end
end
