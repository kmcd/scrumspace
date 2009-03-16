module TasksHelper
  def owner_select_options(product)
    ['All'].push(product.team).flatten.map do |demo|
      "<option>#{demo}</option>" 
    end.to_s
  end
  
  def demo_select_options(product)
    ['All'].push(product.demos).flatten.map do |demo|
      "<option>#{demo}</option>" 
    end.to_s
  end
end
