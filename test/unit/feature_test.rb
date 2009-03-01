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
  
  test "should have a demo" do
    assert @create_feature.demo.instance_of?(Date)
  end
  
  test "should have tasks" do
    assert @create_feature.tasks.first.instance_of?(Task)
  end
end

class FeatureStatusTest < ActiveSupport::TestCase
  test "should have a not started status" do
    assert @create_feature.status == "Not started"
  end
  
  test "should have an in progress status" do
    @create_feature.update_attribute :status, 2
    assert @create_feature.status == "In progress"
  end
  
  test "should have an awaiting verificaion status" do
    @create_feature.update_attribute :status, 3
    assert @create_feature.status == "Awaiting verification"
  end
  
  test "should have an done status" do
    @create_feature.update_attribute :status, 4
    assert @create_feature.status == "Done"
  end
end
