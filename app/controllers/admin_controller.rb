class AdminController < ApplicationController
  before_filter :create_person, :only => :home
  def create_person
    @person
    ThotWorker.create(:name => "Vinay")
    ThotWorker.create(:name => "Ash")
    ThotWorker.create(:name => "Piyush")
  end
  def home
    @person =Person.create
  end

  def matrix
    @person = Person.create(params[:person])
    tw1 = ThotWorker.find_by_name(@person.name1)
    tw2 = ThotWorker.find_by_name(@person.name1)

      ThotWorker.pair(ThotWorker.find_by_name(@person.name1),ThotWorker.find_by_name(@person.name2))
        @index
  end

end
