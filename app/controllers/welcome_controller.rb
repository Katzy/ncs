class WelcomeController < ApplicationController

  def index
    @users = User.order('school ASC')
  end

end
