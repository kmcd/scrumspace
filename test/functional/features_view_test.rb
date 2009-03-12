require 'test_helper'

#  REST actions: new, create, delete, index
class IndexViewTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    get :index
  end
  
  def each_feature
    @scrumspace.features.each { |f| yield f }
  end
  
  test "should have a form to create a new feature" do
    assert_select "form[action=/features]", 1
  end
  
  test "should have a form to update each existing feature" do
    each_feature do |f| 
      assert_select "form[action=/features/#{f.id}]", 1 
    end
  end
  
  test "should have a submit button" do
    each_feature do |f| 
      assert_select "form[action=/features/#{f.id}] button", 1
    end
  end
  
  test "should have textarea description" do
    each_feature do |f|
      assert_select "form[action=/features/#{f.id}] textarea[name=?]", /feature\[description\]/
    end
  end
  
  test "should have number select for estimate" do
    each_feature do |f|
      assert_select "form[action=/features/#{f.id}] select[name=?]", /feature\[estimate\]/
    end
  end
  
  test "should have date select for demo" do
    each_feature do |f|
      # FIXME: find out how to match rails date form helper output
      # assert_select "form[action=/features/#{f.id}] select[name=?]", /feature\[estimate\]/
    end
  end
end
