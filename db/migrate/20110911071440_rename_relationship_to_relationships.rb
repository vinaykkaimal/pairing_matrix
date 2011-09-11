class RenameRelationshipToRelationships < ActiveRecord::Migration
  def self.up
    rename_table :relationship, :relationships
  end

  def self.down
    rename_table :relationships, :relationship
  end
end
