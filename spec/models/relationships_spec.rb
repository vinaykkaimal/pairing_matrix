require 'spec_helper'

describe Relationship do
  before(:each) do
    @pairee = Factory(:thot_worker)
    @pairer = Factory(:thot_worker)
    @relationship = @pairee.relationships.new(:pairer_id => @pairer.id)
  end
  it "should create a new instance given valid attributes" do
    @relationship.save!
  end
end
