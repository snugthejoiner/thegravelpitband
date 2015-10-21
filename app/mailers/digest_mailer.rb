class DigestMailer < ApplicationMailer

  def monthly_email(user)
    @url = 'http://thegravelpitband.com'
    @user = user
    @stories = Story.last_month_in_pit
    @ratings = Rating.last_month_in_pit_rating
    message_params = {:from     => 'no-reply@thegravelpitband.com',
                        :to      =>  user.email,
                        :subject => 'The Gravel Pit Universe Monthly Review'}

    mail(message_params)
  end

end
