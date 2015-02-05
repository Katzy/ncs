class InformationController < ApplicationController
  def about
  end

  def teams_entered
    @users = User.order('name ASC')
  end

  def entry_information
  end

  def schedule
  end

  def map_to_msj
  end

  def place_winners_2014
  end

  def hotels
  end

  def results_prior_years
  end

  def champions_1990_to_2013
  end
end
