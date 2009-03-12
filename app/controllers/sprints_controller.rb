class SprintsController < ApplicationController
  def show
    @features = @product.features.demo(params[:id])
    render :template => 'features/index'
  end
end
