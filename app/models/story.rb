class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  belongs_to :release

  def story_title
    if self.song
      self.song.title
    else
      self.release.title
    end
  end

  default_scope { order(created_at: :desc) }

end
