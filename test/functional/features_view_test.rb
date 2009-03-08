require 'test_helper'

#  REST actions: new, create, delete, index
class IndexViewTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    get :index
  end
  
  test "should have a form for each feature" do
    assert_select "form[action=/features]", @scrumspace.features.size
  end
  
  test "should have a submit button" do
    assert_select "form[action=/features] button", @scrumspace.features.size
  end
  
  test "should have textarea description" do
    assert_select "form[action=/features] textarea[name=?]", /feature\[description\]/
  end
  
  test "should have number select for estimate" do
    assert_select "form[action=/features] select[name=?]", /feature\[estimate\]/
  end
  
  test "should have date select for demo" do
    # TODO: improve assert_select testing
    # assert_select "form[action=/features] select[name=?]", /\[demo(1i)\]/
  end
  
  # form should post to create
end
