require 'test_helper'

# TODO: refactor to:
# view Tasks, "index" do
# should "have a form for each task" do
#     flunk
#   end
# end

class TasksViewTest < ActionController::TestCase
  tests TasksController
  
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
  
  private
  
  def each_task
    @scrumspace.tasks.each {|t| yield t }
  end
  
  def task_form(t)
    "form[action=/tasks/#{t.id}] "
  end
  
  def assert_task_field(form_field, actual=nil)
    each_task do |t|
      assert_select "#{task_form(t)} #{form_field}", actual
    end
  end
end
