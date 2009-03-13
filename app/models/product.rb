class Product < ActiveRecord::Base
  has_many :features do
    def demo(date)
      find :all, :conditions => ["demo = ?", date]
    end
  end
  
  has_many :tasks, :through => :features
end
