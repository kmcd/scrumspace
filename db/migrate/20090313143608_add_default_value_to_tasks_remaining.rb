class AddDefaultValueToTasksRemaining < ActiveRecord::Migration
  def self.up
    change_column :tasks, :remaining, :integer, :default => 3
  end

  def self.down
    change_column :tasks, :remaining, :integer
  end
end
