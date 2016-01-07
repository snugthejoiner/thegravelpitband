class StoryMailer < ApplicationMailer
  def new_story(story)
 
    @story = story
    @user = story.user

    mail(to: "jed@jedparish.com", subject: "New comment from #{@user.name} about #{@story.story_title}")
  end

  def new_comment(story,commenter)
 
    @story = story
    @user = story.user

    mail(to: commenter.email, subject: "New comment from The Gravel Pit Universe")
  end

end
