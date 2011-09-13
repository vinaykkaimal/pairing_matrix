class RenameThotworkersToThoughtworkers < ActiveRecord::Migration
  def self.up
    rename_table :thot_workers, :thought_workers
  end

  def self.down
    rename_table :thot_workers, :thought_workers
  end
end
