class CreatePairs < ActiveRecord::Migration
  def self.up
    create_table :pairs do |t|
      t.string :name1
      t.string :name2

      t.timestamps
    end
  end

  def self.down
    drop_table :pairs
  end
end
