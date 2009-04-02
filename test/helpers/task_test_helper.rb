class TaskFunctionalTest < ActionController::TestCase
  tests TasksController
    
  def setup
    stub_product
    get :index
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
