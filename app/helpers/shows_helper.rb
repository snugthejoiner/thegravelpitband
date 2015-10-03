module ShowsHelper
  def age_at_show(show)
    if show.date - current_user.birthdate < 0
      "You were not alive."
    else
      "You were #{distance_of_time_in_words(show.date,current_user.birthdate).sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old."
    end
  end

end
