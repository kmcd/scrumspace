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
      assert_select(task_form(t) + "input[value=?]", /put/i )
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
    # FIXME: test this when demo assignment is figured out
  end
  
  test "should have a save button for each task" do
    assert_task_field "button", /Save/
  end
  
  test "should have a delete form for each task" do
    each_task do |t|
      assert_select( task_form(t) + " a ", /Delete/  )
    end
  end
  
  test "should have the total remaining for all displayed tasks" do
    assert_select "#subtotal", /#{@scrumspace.tasks.sum(:remaining)}/
  end
end

class TasksViewFilterTest < ActionController::TestCase
  tests TasksController
  
  def setup
    get :index
  end

  # <form action="/tasks" method="get">
  #    <select name="owner"><option>All</option><option>2009-03-16</option> ... <select>
  #    <select name="demo"><option>All</option><option>2009-03-16</option> ... </select>
  #    <button>Select demo</button>
  # </form>
  
  test "should have a task filter" do
    assert_task_filter do
      assert_select "button", /filter/i
    end
  end
  
  test "should be able to filter tasks by owner" do
    assert_task_filter do
      assert_select "select[name=owner]" do
        assert_select "option", /all/i
        @scrumspace.team.each {|member| assert_select "option", /#{member}/i }
      end
    end
  end
  
  test "should be able to filter tasks by existing demo" do
    assert_task_filter do
      assert_select "select[name=demo]" do
        assert_select "option", /all/i
        @scrumspace.demos.each {|date| assert_select "option", /#{date}/i }
      end
    end
  end
  
  def assert_task_filter
    assert_select("form[action=/tasks][method=?]", /get/i)
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
