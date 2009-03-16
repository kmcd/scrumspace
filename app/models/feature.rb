class Feature < ActiveRecord::Base
  # TODO: add :default => 1 to validates_numericality_of instead of DB default
  validates_numericality_of :estimate
  
  belongs_to :product
    
  # TODO: refactor to attr_enum :status, %w( Backlog Started Verification Done )
  STATUS = %w( Backlog Started Done )
  
  def status
    self[:status].nil? ? STATUS.first : STATUS[ self[:status] ] 
  end
  
  def status=(status_type)
    write_attribute :status, STATUS.index(status_type) 
  end
end
