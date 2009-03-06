class Task < ActiveRecord::Base
  validates_numericality_of :remaining
  belongs_to :feature
  
  def product
    feature.product
  end
end
