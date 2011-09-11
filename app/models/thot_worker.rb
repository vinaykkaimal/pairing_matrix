class ThotWorker < ActiveRecord::Base
  attr_accessible :name
  has_many :relationships, :foreign_key => "pairer_id",
                           :class_name => "Relationship",
                           :dependent => :destroy
  has_many :reverse_relationships, :foreign_key => "pairee_id",
                           :class_name => "Relationship",
                           :dependent => :destroy

  def self.pair(pairee, pairer)
    if pairee.id<pairer.id
      Relationship.update_pairings(pairee, pairer)
    elsif pairer.id<pairee.id
      Relationship.update_pairings(pairer, pairee)
    end
  end
end
