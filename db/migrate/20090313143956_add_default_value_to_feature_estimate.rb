class AddDefaultValueToFeatureEstimate < ActiveRecord::Migration
  def self.up
    change_column :features, :estimate, :integer, :default => 1
  end

  def self.down
    change_column :features, :estimate, :integer
  end
end
