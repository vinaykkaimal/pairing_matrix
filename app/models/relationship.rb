class Relationship < ActiveRecord::Base
  attr_accessible :pairee_id, :pairer_id, :pairings

  belongs_to :pairee, :class_name => "ThotWorker"
  belongs_to :pairer, :class_name => "ThotWorker"

  def self.find_pairings(pairee, pairer)
    Relationship.find_by_pairee_id_and_pairer_id(pairee,pairer)
  end

  def self.update_pairings(pairee, pairer)
    relation = find_pairings(pairee,pairer)
    if(!relation.nil?)

      relation.update_attributes(:pairings => (relation.pairings + 1))
    else
      pairer.relationships.create(:pairee_id => pairee.id, :pairings => 1)

    end
  end

end
