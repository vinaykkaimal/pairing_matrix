require 'spec_helper'

describe Relationship do
  before(:each) do
    @pairee = Factory(:thot_worker, :name => "Vinay")

    @pairer = Factory(:thot_worker, :name => "ash")

    @relationship = @pairer.relationships.build(:pairee_id => @pairee.id, :pairings => 1)
    @reverse_relationship = @pairee.reverse_relationships.build(:pairer_id => @pairer.id, :pairings => 1)

  end
  it "should create a new relationship given members of pair" do
    @relationship.save!
  end
  it "should create a new reverse_relationship given members of pair" do
    @reverse_relationship.save!
  end
  describe "a relationship belongs to both members of pair" do

    before(:each) do
      @relationship.save
    end

    it "should have a pairee attribute" do
      @relationship.should respond_to(:pairee)
      @reverse_relationship.should respond_to(:pairee)
    end

    it "should have the right pairee" do
      @relationship.pairee.should == @pairee
      @reverse_relationship.pairee.should == @pairee
    end

    it "should have a pairer attribute" do
      @relationship.should respond_to(:pairer)
      @reverse_relationship.should respond_to(:pairer)
    end

    it "should have the right pairer" do
      @relationship.pairer.should == @pairer
      @reverse_relationship.pairer.should == @pairer

    end
    it "destroying a TWorker should destroy his relationships" do
      @pairee.destroy
      Relationship.find_by_id(@relationship.id).should be_nil
      Relationship.find_by_id(@reverse_relationship.id).should be_nil
    end
  end
  describe "find pairings" do
    before(:each) do
      @reverse_relationship.save
    end
    it "should return the right number of pairings" do
      Relationship.find_pairings(@pairee, @pairer).pairings.should == 1
    end
    it "should return nil for people who haven't paired" do
      @pairerer= Factory(:thot_worker, :name => "Piyush")
      Relationship.find_pairings(@pairee, @pairerer).should be_nil
    end
  end
  describe "update pairings" do
    before(:each) do
      @relationship.save
    end
    it "should return the updated number of pairings" do
      Relationship.update_pairings(@pairee, @pairer)
      Relationship.find_pairings(@pairee, @pairer).pairings.should == 2
    end
    it "should create new pair for people who haven't paired" do
      @pairerer= Factory(:thot_worker, :name => "Piyush")
      Relationship.update_pairings(@pairee, @pairerer)
      Relationship.find_pairings(@pairee, @pairerer).should_not be_nil
    end
  end
  describe "pair" do

     before(:each) do
       @pairerer = Factory(:thot_worker, :name => "Piyush")
       @relationship = @pairer.relationships.build(:pairee_id => @pairee.id, :pairings => 1)
     end

     it "should update pairings" do
       relation = Relationship.pair(@pairer,@pairee)
       Relationship.find_pairings(@pairee,@pairer).should == relation
     end
     it "should create new pair for first timers" do
       Relationship.pair(@pairee,@pairerer)
       Relationship.find_pairings(@pairee,@pairerer).should_not be_nil
     end
  end

  describe "times_paired" do
     before(:each) do
           @pairerer = Factory(:thot_worker, :name => "Piyush")
           @relation = Relationship.pair(@pairer,@pairee)
     end

     it "should show  pairings" do
           Relationship.times_paired(@pairee.id,@pairer.id).should == @relation.pairings
     end
     it "should return zero for first timers" do
           Relationship.times_paired(@pairee.id,@pairerer.id).should_not be_nil
     end
  end


end
