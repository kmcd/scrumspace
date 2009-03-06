require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should have a name" do
    assert @scrumspace.name == 'scrumspace'
  end
end
