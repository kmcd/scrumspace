require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "should be able to signup" do
    assert Account.new(:login => 'test', :password => 'foobar', 
      :password_confirmation => 'foobar').valid?
  end
  
  test "should authorise product access" do
    assert @keith.access?(@scrumspace)
  end
  
  test "should have access to many products" do
    assert @keith.products.include? @scrumspace
  end
end
