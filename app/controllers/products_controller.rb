class ProductsController < ApplicationController
  public_facing
  
  def create
    @product = Product.create! params[:product]
    redirect_to features_path :host => product_url_for(@product.name)
  end
end
