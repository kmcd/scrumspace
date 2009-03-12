class FeaturesController < ApplicationController
  def index
    @features = find_product.features
  end
  
  def create
    find_product.features.create! params[:feature]
    redirect_to features_path
  end
  
  private
  
  def find_product
    # FIXME: should assign from logged in account
    Product.find_by_name("scrumspace")
  end
end
