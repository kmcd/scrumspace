require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  RESERVED_NAMES = %w( support blog www billing help api )
  
  test "should have a unique name" do
    assert_equal 'scrumspace', @scrumspace.name
    assert_invalid { @scrumspace.update_attributes! :name => '' }
    assert_invalid { Product.create! :name => @scrumspace.name }
  end
  
  test "should not allow #{RESERVED_NAMES.join(',')} product names" do
    RESERVED_NAMES.each do |name|
      assert_invalid { @scrumspace.update_attributes! :name => name }
    end
  end
  
  test "should have features" do
    # TODO: refactor to test all features are in fact ScrumSpace features
    assert_equal Feature.count, @scrumspace.features.size
  end
  
  test "should find features for a given demo" do
    assert_equal [@create_feature], @scrumspace.features.demo(@create_feature.demo.to_s(:db))
  end
  
  test "should find all features if no demo provided" do
    assert_equal @scrumspace.features, @scrumspace.features.demo('Foo')
    assert_equal @scrumspace.features, @scrumspace.features.demo(nil)
  end
  
  test "should have tasks" do
    assert_equal [@create_mockups,@create_data_model], @scrumspace.tasks
  end
  
  test "should have (alphabetically ordered) team members" do
    assert_equal %w(Keith Ringo), @scrumspace.reload.team
  end
  
  test "should have all feature demos in chronological order" do
    assert_equal %w(2009-03-01 2009-03-14), @scrumspace.demos.map {|d| d.to_s(:db) }
  end
end
