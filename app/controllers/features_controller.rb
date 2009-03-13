class FeaturesController < ApplicationController
  def index
    @features = @product.features
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
    redirect_to features_path
  end
end
