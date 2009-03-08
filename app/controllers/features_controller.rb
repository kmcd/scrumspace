class FeaturesController < ApplicationController
  def index
    @product  = Product.find_by_name("scrumspace")
    @features = @product.features
  end
end
