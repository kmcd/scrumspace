class TasksController < ApplicationController
  def index
    @tasks = @product.tasks
  end
  
  def destroy
    @product.tasks.destroy(params[:id])
    redirect_to tasks_path
  end
  
  def update
    @product.tasks.find(params[:id]).update_attributes!(params[:task])
    redirect_to tasks_path
  end
  
  def create
    @product.tasks.create! params[:task]
    redirect_to tasks_path
  end
  
  def filter
    @tasks = @product.tasks.filter(params[:task])
    render :template => 'tasks/index'
  end
end
