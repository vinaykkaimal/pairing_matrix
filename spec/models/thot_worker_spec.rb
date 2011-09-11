require 'spec_helper'

describe ThotWorker do
  it "should create a new instance given a name" do
    ThotWorker.create!(:name => "Vinay")
  end
end
