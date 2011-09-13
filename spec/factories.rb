class Factories

Factory.define :thought_worker do |thought_worker|
  thought_worker.name                  "Vinay"
end

Factory.define :relationship do |relationship|

  relationship.association :thought_worker
end

end
