class Sprint
  attr_reader :demo
  
  def initialize(demo)
    @demo = Date.parse(demo)
  end
  
  def estimate
    Feature.sum(:estimate, :conditions => ["demo = ?", @demo] )
  end
  
  def features
    Feature.find(:all, :conditions => ["demo = ?", @demo] )
  end
end
