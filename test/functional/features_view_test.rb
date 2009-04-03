require 'test_helper'

#  REST actions: new, create, delete, index
class FeaturesViewIndexTest < FeatureFunctionalTest
  test "should have a form to create a new feature" do
    assert_select "form[action=/features][method=?]", /post/i
  end
  
  test "should have a form to update each existing feature" do
    each_feature do |f|
      assert_select "div[id=feature_#{f.id}]"
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
end

class FeaturesDeleteTest < FeatureFunctionalTest
  test "should have a delete form for each feature" do
    each_feature do |f|
      assert_select "form[action=/features/#{f.id}] .buttons a", /Delete/
    end
  end
  
  test "should remove delete" do
    login_with @keith
    xhr :delete, :destroy, :id => @prioritise_features.id
    # TODO: investigate why "$(\"feature_682820712\").hide();" is not asserting correctly
    # puts @response.body.inspect
    # assert_select_rjs :hide, "feature_#{@prioritise_features.id}"
  end
end

class FeaturesViewIndexSprintSelectionTest < FeatureFunctionalTest
  
  # <form action="/features" method="get">
  #    <select id="demo" name="demo"><option>All</option><option>2009-03-16</option> ... </select>
  #    <button>Select demo</button>
  # </form>

  test "should be able to select all features" do
    assert_select("form[action=/features][method=?]", /get/i) do
      assert_select "button", /\w+/
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
