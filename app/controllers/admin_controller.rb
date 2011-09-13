class AdminController < ApplicationController

  def home
    @pair =Pair.new
  end

  def matrix
    @pair = Pair.create(params[:pair])
    @index = Relationship.pair(ThoughtWorker.find_by_name(@pair.name1),ThoughtWorker.find_by_name(@pair.name2))
  end

  def pair_finder
    @pair =Pair.new
  end

  def no_of_pairings
    @pair = Pair.create(params[:pair])
    @index = Relationship.times_paired(ThoughtWorker.find_by_name(@pair.name1).id, ThoughtWorker.find_by_name(@pair.name2).id)

  end



end
