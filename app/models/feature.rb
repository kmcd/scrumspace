class Feature < ActiveRecord::Base
  validates_numericality_of :estimate
  
  # Simplest solution for feature status. 
  # Pass in an integer to save and return string based on case statement below
  # Maybe refactor to has_contant or Acts as State Machine
  def status
    case self[:status]
    when 2 : 'In progress'
    when 3 : 'Awaiting verification'
    when 4 : 'Done'
    else
      'Not started'
    end
  end
end
