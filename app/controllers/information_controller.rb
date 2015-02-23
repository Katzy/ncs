class InformationController < ApplicationController


  def seeds
    @wrestlers = Wrestler.where("seed >0 AND seed<9")
    wrestlers = Wrestler.where("seed >0 AND seed<9")
    @wrestlers = @wrestlers.order('weight ASC, seed ASC')
    if @wrestlers.count > 0
      @weight = @wrestlers.first.weight
    end
    respond_to do |format|
        format.html
        format.csv { send_data wrestlers.to_csv, filename: seeds + '.csv' }
      end
  end


  def brackets_2014
  end

  def about
  end

  def teams_entered
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
