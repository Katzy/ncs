class WelcomeController < ApplicationController

  def index
    @users = User.order('league ASC')
  end

end
