class CreateThotWorkers < ActiveRecord::Migration
  def self.up
    create_table :thot_workers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :thot_workers
  end
end
