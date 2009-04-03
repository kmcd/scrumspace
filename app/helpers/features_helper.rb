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
    @product.features.empty?
  end
  
  def new_feature_visability
    'display: none' unless blank_slate?
  end
  
  def new_feature_link
    unless blank_slate?
      link_to_function('Hide') do |page| 
        page[:new].toggle
      end
    end
  end
end
