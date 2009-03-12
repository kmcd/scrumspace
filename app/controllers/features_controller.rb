class FeaturesController < ApplicationController
  def index
    @features = @product.features
  end
  
  def create
    @product.features.create! params[:feature]
    redirect_to features_path
  end
  
  def update
    Feature.find(params[:id]).update_attributes! params[:feature]
    redirect_to features_path
  end
end
