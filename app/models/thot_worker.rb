class ThotWorker < ActiveRecord::Base
  attr_accessible :name
  has_many :relationships, :foreign_key => "pairer_id",
                           :dependent => :destroy

end
