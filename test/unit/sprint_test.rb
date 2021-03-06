require 'test_helper'

class SprintTest < ActiveSupport::TestCase
  def setup
    @sprint = Sprint.new '2009-03-01'
  end
  
  test "should have a demo date" do
    assert @sprint.demo.instance_of?(Date)
  end
  
  test "should have features to demo" do
    assert_equal @sprint.features, [@create_feature]
  end
  
  test "should calcuate total of all estimated features" do
    assert @create_feature.estimate, @sprint.estimate
  end
  
  test "should calcuate total tasks remaining" do
    assert_equal @create_mockups.remaining, @sprint.remaining
  end
  
  test "should calcuate developers total tasks remaining" do
    assert_equal @create_mockups.remaining, @sprint.remaining('Keith')
  end
end
