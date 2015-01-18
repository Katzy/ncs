class UserMailer < ActionMailer::Base
  default from: "msjwrestlinginvitational@gmail.com"

  def team_updated(user)
    @user = user
    mail(to: "lhkatz@pacbell.net", subject: "Team Info Updated")
  end

  def wrestler_updated(user)
    @user = user
    mail(to: "scottalankatz@gmail.com", subject: "Wrestler Info Updated")
  end
end
