module FeaturesHelper
  def demo_select_options(product)
    # TODO: refactor using rails option/select helper or builder
    ['All demos'].push(product.demos).flatten.map do |demo|
      "<option>#{demo}</option>" 
    end.to_s
  end
end
