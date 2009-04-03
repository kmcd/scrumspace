class CreateAuthorisations < ActiveRecord::Migration
  def self.up
    create_table :authorisations do |t|
      t.integer :product_id
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :authorisations
  end
end
