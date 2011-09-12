require 'spec_helper'

describe ThotWorker do
  it "should create a new instance given a name" do
    ThotWorker.create!(:name => "Vinay")



  end
  describe "relationships" do

      before(:each) do
        @pair = ThotWorker.create(:name => "Vinay")

      end

      it "should have a relationships method" do
        @pair.should respond_to(:relationships)
      end

      it "should have a reverse_relationships method" do
        @pair.should respond_to(:reverse_relationships)
      end
  end

  describe "pair" do

      before(:each) do
      @pairee = ThotWorker.create(:name => "Vinay")

      @pairer = ThotWorker.create(:name => "ash")
      @pairerer = ThotWorker.create(:name => "piyush")
      @relationship = @pairer.relationships.build(:pairee_id => @pairee.id, :pairings => 1)
      end

      it "should update pairings" do
        relation = ThotWorker.pair(@pairer,@pairee)
        Relationship.find_pairings(@pairee,@pairer).should == relation
      end
      it "should create new pair for first timers" do
        ThotWorker.pair(@pairee,@pairerer)
        Relationship.find_pairings(@pairee,@pairerer).should_not be_nil
      end



  end

  describe "times_paired" do
    before(:each) do
          @pairee = ThotWorker.create(:name => "Vinay")

          @pairer = ThotWorker.create(:name => "ash")
          @pairerer = ThotWorker.create(:name => "piyush")
          @relation = ThotWorker.pair(@pairer,@pairee)
    end

    it "should show  pairings" do

            ThotWorker.times_paired(@pairee.id,@pairer.id).should == @relation.pairings
    end
    it "should return zero for first timers" do

            ThotWorker.times_paired(@pairee.id,@pairerer.id).should_not be_nil
    end


  end
end

