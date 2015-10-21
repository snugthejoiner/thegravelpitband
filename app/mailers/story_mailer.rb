class StoryMailer < ApplicationMailer
  def new_story(story)
 
    @story = story
    @user = story.user

    mail(to: "jed@jedparish.com", subject: "New comment from #{@user.name}")
  end
end
