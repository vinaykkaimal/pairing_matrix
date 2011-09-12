class AdminController < ApplicationController

  def home
    @pair =Pair.new
  end

  def matrix
    @pair = Pair.create(params[:pair])
    @index = Relationship.pair(ThotWorker.find_by_name(@pair.name1),ThotWorker.find_by_name(@pair.name2))
    @index
  end

  def relation
    @person =Pair.new
  end

  def result
    @pair = Pair.create(params[:pair])
    @index = Relationship.times_paired(ThotWorker.find_by_name(@pair.name1).id,ThotWorker.find_by_name(@pair.name2).id)

  end



end
