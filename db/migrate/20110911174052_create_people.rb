class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name1
      t.string :name2

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
