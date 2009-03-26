module TasksHelper
  # TODO: dry up these helpers
  def team_select_options(product)
    prompt =  options_for_select("All people") 
    prompt += options_from_collection_for_select(product.team, :dup , :dup, params[:owner])
  end
  
  def demo_select_options(product)
    prompt =  options_for_select("All demos") 
    prompt += options_from_collection_for_select(product.demos, :dup , :dup, params[:demo])
  end
end
