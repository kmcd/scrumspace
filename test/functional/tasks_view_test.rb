require 'test_helper'

# TODO: refactor to:
# view Tasks, "index" do
#   should "have a form for each task" do
#     flunk
#   end
# end
class TasksViewIndexTest < ActionController::TestCase
  tests TasksController
  include TasksTestHelper
  
  def setup
    get :index
  end
  
  test "should have an update form for each task" do
    each_task do |t| 
      assert_select(task_form(t) + "input[value='PUT']")
    end
  end
  
  test "should have a description for each task" do
    assert_task_field "input[name='task[description]']"
  end
  
  test "should have an owner for each task" do
    assert_task_field "input[name='task[owner]']"
  end
  
  test "should have time remaining for each task" do
    assert_task_field "select[name='task[remaining]']"
  end
  
  test "should have a demo for each task" do
    assert_task_field "select[name=?]", /task\[demo\(\d\w\)\]/
  end
  
  test "should have a save button for each task" do
    assert_task_field "button", /Save/
  end
  
  test "should have a delete form for each task" do
    each_task do |t|
      assert_select( task_form(t) + "input[value='DELETE']" )
    end
  end
  
  test "should have the total remaining for all displayed tasks" do
    assert_select "#subtotal", /#{@scrumspace.tasks.sum(:remaining)}/
  end
end

class TasksViewCreateTest < ActionController::TestCase
  tests TasksController
  include TasksTestHelper
  
  def setup
    get :index
  end
  
  test "should have a form to create a new task" do
    assert_select "form[action=/tasks]"
  end
end
