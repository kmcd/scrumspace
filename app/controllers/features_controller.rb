class FeaturesController < ApplicationController
  def index
    @features = @product.features.demo(params[:demo])
  end
  
  def create
    @product.features.create! params[:feature]
    redirect_to features_path
  end
  
  def update
    @product.features.find(params[:id]).update_attributes! params[:feature]
    redirect_to features_path
  end
  
  def destroy
    @product.features.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to features_path }
      format.js   { render }
    end
  end
end
