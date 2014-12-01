class WelcomeController < ApplicationController

  def index
    @teams = Team.order('name ASC')
  end

  def about
  end


end
