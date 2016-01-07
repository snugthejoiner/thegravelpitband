class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :release
  belongs_to :show

  validates :body, length: { maximum: 1000 }

  scope :new_stories, -> { order(updated_at: :desc).limit(5) }
  scope :storyline, -> { order(updated_at: :desc) }

  after_commit :send_new_story_email
  after_commit :send_new_comment_email
  after_commit :send_new_relevant_comment_email

  def story_title
    if self.song
      self.song.title
    elsif self.release
      self.release.title
    else
      self.show.description + " on " + self.show.date.strftime('%B %e, %Y')
    end
  end

  def user_story_sort
    self.user.sortation + (Time.now - self.created_at).to_s
  end

  def self.sorted_by_user_type
    Story.all.sort_by(&:user_story_sort)
  end

  def send_new_story_email
    StoryMailer.new_story(self).deliver_now
  end

  def send_new_comment_email
    User.comment_subscriber.each do |c|
      StoryMailer.new_comment(self,c).deliver_now
    end
  end

  def send_new_relevant_comment_email
    User.relevant_comment_subscriber.each do |c|
      if self.song && self.song.storied_by_user?(c)
        StoryMailer.new_comment(self,c).deliver_now
      end
    end
  end
  
  def self.last_month_in_pit
    if ENV['RAILS_ENV'] == 'development'    # sqlite3 version
      where("strftime('%m', updated_at) + 0 = ?", 1.month.ago.month)
    else # postgres version
      where("extract(month from updated_at) = ?", 1.month.ago.month)
    end
  end

end
