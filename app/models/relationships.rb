class Relationship < ActiveRecord::Base
  attr_accessible :pairee_id, :pairer_id
  belongs_to :pairee, :class_name => "ThotWorker"
  belongs_to :pairer, :class_name => "ThotWorker"


end
