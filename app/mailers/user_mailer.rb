class UserMailer < ActionMailer::Base
  default from: "msjwrestlinginvitational@gmail.com"



  def new_user(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to MSJ Wrestling Invitational Website / ACTION REQUIRED")
  end

  def team_updated(user)
    @user = user
    mail(to: "lhkatz@pacbell.net", subject: "Team Info Updated")
  end

  def wrestler_updated(user)
    @user = user

    mail(to: ["scottalankatz@gmail.com", "lhkatz@pacbell.net"], subject: "Wrestler Info Updated")
  end

  def wrestler_added(user)
    @user = user

    mail(to: ["scottalankatz@gmail.com", "lhkatz@pacbell.net"], subject: "Wrestler Added")
  end

  def wrestler_deleted(user)
    @user = user

    mail(to: ["scottalankatz@gmail.com", "lhkatz@pacbell.net"], subject: "Wrestler Deleted")
  end
end
