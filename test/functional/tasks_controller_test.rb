require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  def setup
    get :index
  end
  
  test "should have an index" do
    assert_response :success
  end
  
  test "should assign all products tasks for index" do
    assert_equal @scrumspace.tasks, assigns(:tasks)
  end
end

class TasksControllerDeleteTest < ActionController::TestCase
  tests TasksController
  
  def setup
    delete :destroy, {:id => @create_mockups.id}
  end
  
  test "should destroy the specified task" do
    assert_raise ActiveRecord::RecordNotFound do
      Task.find(@create_mockups.id)
    end
  end
  
  test "should return browser to index" do
    assert_redirected_to tasks_path
  end
end

class TasksControllerUpdateTest < ActionController::TestCase
  tests TasksController
  
  def setup
    put :update, {:id => @create_mockups.id, :task => {:description => 'foo'}}
  end
  
  test "should update the specified task" do
    assert_equal 'foo', @create_mockups.reload.description
  end
  
  test "should return browser to index" do
    assert_redirected_to tasks_path
  end
end

class TasksControllerCreateTest < ActionController::TestCase
  tests TasksController
  
  def setup
    post :create, :task => {:description => 'foo'}
  end
  
  test "should update the specified task" do
    assert_equal 'foo', @scrumspace.tasks.last.description
  end
  
  test "should return browser to index" do
    assert_redirected_to tasks_path
  end
end

class TasksControllerFilterTest < ActionController::TestCase
  tests TasksController
  
  test "should have a /tasks/filter route" do
    assert_routing filter_tasks_path, {:controller => 'tasks', :action => 'filter'}
  end
  
  test "should render the default template" do
    get :filter
    assert_response :success
    assert_template 'tasks/index'
  end
  
  test "should fetch tasks for a given demo" do
    get :filter, :task => { :demo => @create_mockups.demo }
    assert_equal [@create_mockups], assigns(:tasks)
  end
  
  test "should fetch tasks for a given owner" do
    get :filter, :task => { :owner => @create_mockups.owner }
    assert_equal [@create_mockups], assigns(:tasks)
  end
  
  test "should fetch tasks for a given demo & owner" do
    get :filter, :task => { :demo => @create_data_model.demo, :owner => @create_data_model.owner }
    assert_equal [@create_data_model], assigns(:tasks)
  end
end
