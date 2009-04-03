class Account < ActiveRecord::Base
  acts_as_authentic
  has_many  :authorisations
  has_many  :products, :through => :authorisations
  
  def access?(product)
    authorisations.map(&:product_id).include? product.id
  end
end
