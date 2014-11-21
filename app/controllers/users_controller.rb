class UsersController < Devise::RegistrationsController
  before_action { puts "HELLO FRIENDS" }

end