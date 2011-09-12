require 'spec_helper'

describe AdminController do
  render_views
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have a submit button" do
      get 'home'
      response.should have_selector("input",
                                    :type => "submit")
    end
    it "should have a text field" do
      get 'home'
      response.should have_selector("input",
                                    :type => "text")
    end

    it "should route to the matrix page" do
      get 'home'
      response.should have_selector("form",
                                    :action => "/matrix")
    end
  end

  describe "GET 'matrix'" do
    before(:each) do
       @mock_pairing = mock(Relationship)
       @mock_pair = mock(Pair, :name1 => "Vinay", :name2 => "Ash")
    end
    it "should be successful" do
      Relationship.should_receive(:pair).and_return(@mock_pairing)
      get 'matrix'
      response.should be_success
    end
    it "should have a matrix" do
      Relationship.should_receive(:pair).and_return(@mock_pairing)
      get 'matrix'
      response.should have_selector("table")
    end

    it "should get names from the form" do
      Pair.should_receive(:create).with({"name1" => "Vinay", "name2" => "Ash"}).and_return(@mock_pair)
      post 'matrix', {"pair" => {"name1" => "Vinay", "name2" => "Ash"}}
      assigns[:pair].should == @mock_pair
    end

    it "should pass the value to the model" do
      Pair.should_receive(:create).with({"name1" => "Vinay", "name2" => "Ash"}).and_return(@mock_pair)
      Relationship.should_receive(:pair).once.with(ThotWorker.find_by_name("Vinay"), ThotWorker.find_by_name("Ash"))
      post 'matrix', {"pair" => {"name1" => "Vinay", "name2" => "Ash"}}
    end

    it "should display the updated value in the view" do
      Relationship.should_receive(:pair).and_return(@mock_pairing)
      Relationship.should_receive(:times_paired).exactly(9).times.and_return("Hulabaloo")
      post 'matrix', {"pair" => {"name1" => "Vinay", "name2" => "Ash"}}
      response.should have_selector("td", :content => "Hulabaloo")
    end
  end



end
