class Feature < ActiveRecord::Base
  # TODO: add :default => 1 to validates_numericality_of instead of DB default
  validates_numericality_of :estimate
  
  belongs_to :product
    
  # TODO: refactor to has_a :status, %w( Backlog Started Verification Done )
  STATUS = %w( Backlog Started Verification Done )
  
  def status
    self[:status].nil? ? STATUS.first : STATUS[ self[:status] ] 
  end
  
  def status=(status_type)
    write_attribute :status, STATUS.index(status_type) 
  end
end
