class Product < ActiveRecord::Base
  validates_presence_of :name
  # Product name is used as subdomain
  validates_exclusion_of :name, :in => %w( support blog www billing help api )
  
  has_many :features do
    # TODO: refactor to named scope & private methods
    def demo(date)
      if date =~ /\d{4}-\d{2}-\d{2}/
        find :all, :conditions => ["demo = ?", date]
      else
        find :all
      end
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
