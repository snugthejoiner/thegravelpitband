class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :release
  belongs_to :show

  validates :body, length: { maximum: 1000 }

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

end
