class TasksController < ApplicationController
  
  def index
    @tasks = @product.tasks.filter(params[:task])
  end
  
  def destroy
    @product.tasks.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js   { render }
    end
  end
  
  def update
    @product.tasks.find(params[:id]).update_attributes!(params[:task])
    redirect_to tasks_path
  end
  
  def create
    @product.tasks.create! params[:task]
    redirect_to tasks_path
  end
end
