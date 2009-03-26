class Task < ActiveRecord::Base
  validates_numericality_of :remaining
  belongs_to :product
  named_scope :conditions, lambda { |*args| {:conditions => args} }

  # Should filter by owner and/or date
  def self.filter(task={})
    tasks = scoped({})
    tasks = tasks.conditions("demo = ?", task[:demo])   if demo?(task)
    tasks = tasks.conditions("owner = ?", task[:owner]) if owner?(task)
    tasks
  end
  
  private
  
  def self.demo?(task)
    task && task[:demo] && task[:demo] !~ /all/i
  end
  
  def self.owner?(task)
    task && task[:owner] && task[:owner] !~ /all/i
  end
end
