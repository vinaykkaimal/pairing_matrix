class AdminController < ApplicationController
  #before_filter :create_person, :only => :home
  #def create_person
  #  @person
  #  ThotWorker.create(:name => "Vinay")
  #  ThotWorker.create(:name => "Ash")
  #  ThotWorker.create(:name => "Piyush")
  #end
  def home
    @person =Person.create
  end

  def matrix
    @person = Person.create(params[:person])
    ThotWorker.pair(ThotWorker.find_by_name(@person.name1),ThotWorker.find_by_name(@person.name2))
    @index
  end

  def relation
    @person =Person.create
  end

  def result
    @person = Person.create(params[:person])
    @index = ThotWorker.times_paired(ThotWorker.find_by_name(@person.name1).id,ThotWorker.find_by_name(@person.name2).id)

  end



end
