class UserMailer < ApplicationMailer
    def new_user(user)
 
        @user = user

        mail(to: "jed@jedparish.com", subject: "New user #{@user.name}")
    end
end
