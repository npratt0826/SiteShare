class UserMailer < ApplicationMailer
  default from: "nicholasapratt@gmail.com"

  def new_user(user)
     headers["Message-ID"] = "#{user.username}"
     headers["In-Reply-To"] = "#{user.username}"
     headers["References"] = "#{user.username}"

     @user = user
     mail(to: user.email, subject: "Welcome #{user.username}")
   end
end
