require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(:login => 'kmcd', :password => 'foobar', 
      :password_confirmation => 'foobar')
  end
  
  test "should be able to signup" do
    assert @account.valid?
    assert @account.save!
  end
  
  test "should be able to login" do
  end
  
  test "should have a product by default" do
  end
end
