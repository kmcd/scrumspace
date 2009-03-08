class Feature < ActiveRecord::Base
  validates_numericality_of :estimate
  has_many :tasks
  belongs_to :product
  STATUS = [ 'Backlog', 'Started', 'Verification', 'Done' ]
  
  # Maybe refactor to has_contant or Acts as State Machine
  def status
    STATUS[ self[:status] - 1]
  end
end
