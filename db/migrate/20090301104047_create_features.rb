class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.text :description
      t.integer :estimate
      t.date :demo
      t.integer :status
    end
  end

  def self.down
    drop_table :features
  end
end
