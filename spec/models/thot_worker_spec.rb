require 'spec_helper'

describe ThotWorker do
  before(:each) do
    @pairee = ThotWorker.create!(:name => "Vinay")
    @pairer = ThotWorker.create!(:name => "Ash")
    @relationship = @pairer.relationships.create(:pairee_id => @pairee.id, :pairings => 1)

  end





end

describe "relationships" do

    before(:each) do
      @pair = ThotWorker.create!(:name => "Vinay")

    end

    it "should have a relationships method" do
      @pair.should respond_to(:relationships)
    end

    it "should have a reverse_relationships method" do
      @pair.should respond_to(:reverse_relationships)
    end
end
