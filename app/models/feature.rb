class Feature < ActiveRecord::Base
  # TODO: add :default => 1 to validates_numericality_of
  validates_numericality_of :estimate, :default => 1
  before_validation :ensure_numerical_estimate
  
  has_many :tasks
  belongs_to :product
    
  # TODO: refactor to has_a :status, %w( Backlog Started Verification Done )
  STATUS = %w( Backlog Started Verification Done )
  
  def status
    self[:status].nil? ? STATUS.first : STATUS[ self[:status] ] 
  end
  
  def status=(status_type)
    write_attribute :status, STATUS.index(status_type) 
  end
  
  private
  
  def ensure_numerical_estimate
    self[:estimate] = 1 unless self[:estimate]
  end
end
