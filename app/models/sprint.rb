class Sprint
  attr_reader :demo
  
  def initialize(demo)
    @demo = Date.parse(demo)
  end
  
  def estimate
    Feature.sum :estimate, current_demo
  end
  
  def features
    Feature.find :all, current_demo
  end
  
  def remaining(owner=nil)
    conditions = if owner.nil?
      current_demo
    else
      {:conditions => ["demo = ? AND owner = ?", @demo, owner]}
    end
    Task.sum :remaining, conditions
  end
  
  private
  
  def current_demo
    {:conditions => ["demo = ?", @demo]}
  end
end
