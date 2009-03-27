class TasksController < ApplicationController
  def index
    @tasks = @product.tasks.filter(params)
  end
  
  def destroy
    @product.tasks.find(params[:id]).destroy
    response_format
  end
  
  def update
    @task = @product.tasks.find(params[:id]).update_attributes!(params[:task])
    response_format
  end
  
  def create
    @task = @product.tasks.create! params[:task]
    response_format
  end
  
  private
  
  def response_format
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js   { render }
    end
  end
end
