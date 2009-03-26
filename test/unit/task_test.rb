require 'test_helper'

# I'd rather:
# unit_test Task, "create mockups ..." do

class TaskTest < ActiveSupport::TestCase
  test "should have a description" do
    assert @create_mockups.description =~ /html screens/
  end
  
  test "should have an owner" do
    assert @create_mockups.owner == 'Keith'
  end
  
  test "should have a numerical time remaining" do
    assert @create_mockups.remaining == 0
    assert_raise ActiveRecord::RecordInvalid do
      @create_mockups.update_attributes! :remaining => 'foo'
    end
  end
  
  test "should have demo date" do
    assert @create_mockups.demo.instance_of?(Date)
  end
  
  test "should always have a product" do
    assert_equal @scrumspace, @create_mockups.product
  end
end

class TaskFilterTest < ActiveSupport::TestCase
  test "should filter by owner" do
    assert_equal [@create_mockups], @scrumspace.tasks.filter(:owner => 'Keith')
  end
  
  test "should filter by demo" do
    assert_equal [@create_mockups], @scrumspace.tasks.filter(:demo => '2009-03-01')
  end
  
  test "should filter by demo AND owner" do
    assert_equal [@create_data_model], @scrumspace.tasks.
      filter(:owner => 'Ringo', :demo => '2009-03-14')
  end
  
  test "should filter without demo or owner" do
    assert_equal @scrumspace.tasks, @scrumspace.tasks.filter
    assert_equal @scrumspace.tasks, @scrumspace.tasks.filter(nil)
  end
  
  test "should show all demos/owners" do
    assert_equal @scrumspace.tasks, @scrumspace.tasks.filter(:demo  => 'all')
    assert_equal @scrumspace.tasks, @scrumspace.tasks.filter(:owner => 'all')
  end
end
