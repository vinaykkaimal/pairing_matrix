class AdminController < ApplicationController
  before_filter :create_person, :only => :home
  def create_person
    @person
  end
  def home
    @person =Person.create
  end

  def matrix
    @person = Person.create(params[:person])
    tw1 = ThotWorker.find_by_name(@person.name1)
    tw2 = ThotWorker.find_by_name(@person.name1)
    ThotWorker.pair(tw1,tw2)
  end

end
