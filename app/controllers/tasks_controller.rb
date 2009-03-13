class TasksController < ApplicationController
  def index
    @tasks = @product.tasks
  end
end
