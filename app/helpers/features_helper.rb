module FeaturesHelper
  def demo_select_options(product)
    # TODO: refactor using rails option/select helper or builder
    ['All demos'].push(product.demos).flatten.map do |demo|
      "<option>#{demo}</option>" 
    end.to_s
  end
  
  def blank_user_story
    "In order to \nAs a \nI should" 
  end
  
  def blank_slate?
    @features.empty?
  end
end
