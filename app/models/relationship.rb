class Relationship < ActiveRecord::Base
  attr_accessible :pairee_id, :pairer_id, :pairings

  belongs_to :pairee, :class_name => "ThotWorker"
  belongs_to :pairer, :class_name => "ThotWorker"

  def self.find_pairings(pairee, pairer)
    Relationship.find_by_pairee_id_and_pairer_id(pairee,pairer)
  end


end
