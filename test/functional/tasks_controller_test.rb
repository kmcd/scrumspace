require 'test_helper'

class IndexControllerTest < TaskFunctionalTest
  test "should have an index" do
    assert_response :success
  end
  
  test "should assign all products tasks for index" do
    assert_equal @scrumspace.tasks, assigns(:tasks)
  end
end

class TasksControllerDeleteTest < TaskFunctionalTest
  def setup
    login_with @keith
    delete :destroy, :id => @create_mockups.id
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

class TasksControllerUpdateTest < TaskFunctionalTest
  def setup
    login_with @keith
    put :update, {:id => @create_mockups.id, :task => {:description => 'foo'}}
  end
  
  test "should update the specified task" do
    assert_equal 'foo', @create_mockups.reload.description
  end
  
  test "should return browser to index" do
    assert_redirected_to tasks_path
  end
end

class TasksControllerCreateTest < TaskFunctionalTest
  def setup
    login_with @keith
    post :create, :task => {:description => 'foo'}
  end
  
  test "should update the specified task" do
    assert_equal 'foo', @scrumspace.tasks.last.description
  end
  
  test "should return browser to index" do
    assert_redirected_to tasks_path
  end
end

class TasksControllerFilterTest < TaskFunctionalTest
  test "should render the default template" do
    assert_response :success
    assert_template 'tasks/index'
  end
  
  test "should fetch tasks for a given demo" do
    get :index, { :demo => @create_mockups.demo }
    assert_equal [@create_mockups], assigns(:tasks)
  end
  
  test "should fetch tasks for a given owner" do
    get :index, { :owner => @create_mockups.owner }
    assert_equal [@create_mockups], assigns(:tasks)
  end
  
  test "should fetch tasks for a given demo & owner" do
    get :index, { :demo => @create_data_model.demo, :owner => @create_data_model.owner }
    assert_equal [@create_data_model], assigns(:tasks)
  end
end
