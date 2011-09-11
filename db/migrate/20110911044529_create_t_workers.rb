class CreateTWorkers < ActiveRecord::Migration
  def self.up
    create_table :t_workers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :t_workers
  end
end
