require 'test_helper'

# I'd rather:
# test_case "Create mockups task" do
class CreateMockupsTaskTest < ActiveSupport::TestCase
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
  
  test "should have a feature" do
    assert @create_mockups.feature.instance_of?(Feature)
  end
  
  test "should always have a product" do
    assert_equal @scrumspace, @create_mockups.product
  end
end
