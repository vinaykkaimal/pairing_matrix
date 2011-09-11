require 'spec_helper'

describe Relationship do
  before(:each) do
    @pairee = Factory(:thot_worker)

    @pairer = Factory(:thot_worker, :name => "ash")

    @relationship = @pairer.relationships.build(:pairee_id => @pairee.id)


  end
  it "should create a new relationship given valid attributes" do
    @relationship.save!
  end

  describe "a relationship belongs to both members of pair" do

    before(:each) do
      @relationship.save
    end

    it "should have a pairee attribute" do
      @relationship.should respond_to(:pairee)
    end

    it "should have the right pairee" do
      @relationship.pairee.should == @pairee
    end

    it "should have a pairer attribute" do
      @relationship.should respond_to(:pairer)
    end

    it "should have the right followed user" do
      @relationship.pairer.should == @pairer
    end
  end
end
