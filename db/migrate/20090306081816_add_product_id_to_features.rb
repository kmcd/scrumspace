class AddProductIdToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :product_id, :integer
  end

  def self.down
    remove_column :features, :product_id
  end
end
