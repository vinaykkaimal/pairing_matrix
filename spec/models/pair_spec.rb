require 'spec_helper'

describe Pair do
  it "should contain a new pair given names" do
    Pair.create!(:name1 => "Vinay", :name2 => "Ash")
  end

end
