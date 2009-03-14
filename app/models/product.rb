class Product < ActiveRecord::Base
  has_many :features do
    # TODO: refactor to named scope
    def demo(date)
      find :all, :conditions => ["demo = ?", date]
    end
  end
  
  has_many :tasks
  
  def team
    tasks.map(&:owner).uniq.sort
  end
  
  def demos
    features.map(&:demo).uniq.sort
  end
end
