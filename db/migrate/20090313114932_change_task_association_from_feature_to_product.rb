class ChangeTaskAssociationFromFeatureToProduct < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :feature_id
    add_column :tasks, :product_id, :integer
  end

  def self.down
    remove_column :tasks, :product_id
    add_column :tasks, :feature_id, :integer
  end
end
