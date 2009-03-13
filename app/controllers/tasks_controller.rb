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
end
