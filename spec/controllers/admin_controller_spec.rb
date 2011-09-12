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
    it "should be successful" do
      mock_pairing = mock_model(Relationship)
      ThotWorker.should_receive(:pair).any_number_of_times.and_return(mock_pairing)
      get 'matrix'
      response.should be_success
    end
    it "should have a matrix" do

      mock_pairing = mock_model(Relationship)
      ThotWorker.should_receive(:pair).any_number_of_times.and_return(mock_pairing)
      get 'matrix'

      response.should have_selector("table")
    end



  end



end
