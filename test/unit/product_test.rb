require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should have a name" do
    assert_equal 'scrumspace', @scrumspace.name
  end
  
  test "should have features" do
    # TODO: refactor to test all features are in fact ScrumSpace features
    assert_equal Feature.count, @scrumspace.features.size
  end
  
  test "should find all features for a given demo" do
    assert_equal [@create_feature], @scrumspace.features.demo(@create_feature.demo.to_s(:db))
  end
  
  test "should have tasks" do
    assert_equal [@create_mockups,@create_data_model], @scrumspace.tasks
  end
  
  test "should have (alphabetically ordered) steam members" do
    assert_equal %w(Keith Ringo), @scrumspace.reload.team
  end
  
  test "should have all feature demos in chronological order" do
    assert_equal %w(2009-03-01 2009-03-14), @scrumspace.demos.map {|d| d.to_s(:db) }
  end
end
