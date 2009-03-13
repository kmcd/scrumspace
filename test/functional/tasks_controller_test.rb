require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  def setup
    get :index
  end
  
  test "should have an index" do
    assert_response :success
  end
  
  test "should assign all products tasks" do
    assert_equal @scrumspace.tasks, assigns(:tasks)
  end
end
