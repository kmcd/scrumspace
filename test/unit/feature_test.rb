require 'test_helper'

class CreateFeatureTest < ActiveSupport::TestCase
  test "should have a multi line description" do
    # TODO: really test multi-line datatype
    assert @create_feature.description =~ /As a product owner,/
  end
  
  test "should have an numerical estimate" do
    assert @create_feature.estimate == 1
    assert_raise ActiveRecord::RecordInvalid do
      @create_feature.update_attributes! :estimate => 'Foo'
    end
  end
  
  test "should have 1 as default numerical estimate" do
    assert_equal 1, Feature.create!(:description => 'foo').estimate
  end
  
  test "should have backlog as default status" do
    assert_equal 'Backlog', Feature.create!(:description => 'foo').status
  end
  
  test "should have a demo" do
    assert_instance_of Date, @create_feature.demo
  end
  
  test "should have a product" do
    assert_equal @create_feature.product, @scrumspace
  end
end

class FeatureStatusTest < ActiveSupport::TestCase
  test "should have a default not started status" do
    assert_equal "Backlog", @create_feature.status
  end
    
  test "should have an in progress status" do
    @create_feature.update_attribute :status, 'Started'
    assert_equal "Started", @create_feature.reload.status
  end
  
  test "should have an done status" do
    @create_feature.update_attribute :status, "Done"
    assert_equal "Done", @create_feature.reload.status
  end
end
