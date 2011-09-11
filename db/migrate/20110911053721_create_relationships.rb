class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :pairee_id
      t.integer :pairer_id
      t.integer :pairings

      t.timestamps
    end

    add_index :relationships, :pairee_id
    add_index :relationships, :pairer_id
    add_index :relationships, [:pairee_id, :pairer_id], :unique => true
  end

  def self.down
    drop_table :relationships
  end
end
