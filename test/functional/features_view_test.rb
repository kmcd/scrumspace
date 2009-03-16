require 'test_helper'

#  REST actions: new, create, delete, index
class FeaturesViewIndexTest < ActionController::TestCase
  tests FeaturesController
  
  def setup
    get :index
  end
  
  def each_feature
    @scrumspace.features.each { |f| yield f }
  end
  
  test "should have a form to create a new feature" do
    assert_select "form[action=/features][method=?]", /post/i
  end
  
  test "should have a form to update each existing feature" do
    each_feature do |f| 
      assert_select "form[action=/features/#{f.id}] input[value='PUT']" 
    end
  end
  
  test "should have a submit button" do
    each_feature do |f| 
      assert_select "form[action=/features/#{f.id}] button", /Save/
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
  
  test "should have an subtotal of all estimations" do
    assert_select "#subtotal", :text => /#{@scrumspace.features.sum(:estimate)}/
  end
  
  test "should have a delete form for each feature" do
    each_feature do |f|
      assert_select "form[action=/features/#{f.id}] input[value=?]", /delete/i
      assert_select "form[action=/features/#{f.id}] button", /Delete/
    end
  end
end

class FeaturesViewIndexSprintSelectionTest < ActionController::TestCase
  tests FeaturesController
  
  # <form action="/features" method="get">
  #    <select id="demo" name="demo"><option>All</option><option>2009-03-16</option> ... </select>
  #    <button>Select demo</button>
  # </form>

  def setup
    get :index
  end
  
  test "should be able to select all features" do
    assert_select("form[action=/features][method=?]", /get/i) do
      assert_select "button", /demo/i
    end
  end
  
  test "should be able to select all features for a given demo" do
    assert_select("form[action=/features][method=?]", /get/i) do
      assert_select "select[name=demo]" do
        assert_select "option", /all/i
        @scrumspace.demos.each {|d| assert_select "option", d.to_s(:db) }
      end
    end
  end
end
