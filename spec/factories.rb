class Factories

Factory.define :thot_worker do |thot_worker|
  thot_worker.name                  "Vinay"
end

Factory.define :relationship do |relationship|
  relationship.pairings 1
  relationship.association :thot_worker
end

end
