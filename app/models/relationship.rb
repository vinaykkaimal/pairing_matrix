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

  def self.pair(pairee, pairer)
    if pairee.id<pairer.id
      update_pairings(pairee, pairer)
    elsif pairer.id<pairee.id
      update_pairings(pairer, pairee)
    end
  end

  def self.times_paired(pair1,pair2)
    if pair1<pair2
      no_of_times(pair1,pair2)
    elsif pair2<pair1
      no_of_times(pair2,pair1)
    else
      0
    end
  end

  def self.no_of_times(pair1,pair2)
    times = Relationship.find_pairings(ThotWorker.find(pair1), ThotWorker.find(pair2))
        if !times.nil?
          times.pairings
        else
           0
        end

  end

end
