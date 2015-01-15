class InformationController < ApplicationController
  def about
  end

  def teams
    redirect_to teams_path
    # @teams = Team.all
    # teams = Team.order('name ASC')
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data teams.to_csv }
    #   format.xls { send_data teams.to_csv(col_sep: "\t")}
    # end
  end

  def entry_information
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
