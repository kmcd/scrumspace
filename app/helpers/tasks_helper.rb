module TasksHelper
  def owner_select_options(product)
    ['All people'].push(product.team).flatten.map do |demo|
      "<option>#{demo}</option>" 
    end.to_s
  end
  
  def demo_select_options(product)
    ['All demos'].push(product.demos).flatten.map do |demo|
      "<option>#{demo}</option>" 
    end.to_s
  end
end
