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
