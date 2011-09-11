class ThotWorker < ActiveRecord::Base
  attr_accessible :name
  has_many :relationships, :foreign_key => "pairer_id",
                           :dependent => :destroy
  has_many :reverse_relationships, :foreign_key => "pairee_id",
                           :class_name => "Relationship",
                           :dependent => :destroy

end
