require 'spec_helper'

describe ThotWorker do
  it "should create a new instance given a name" do
    ThotWorker.create!(:name => "Vinay")
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
