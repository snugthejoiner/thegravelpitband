module ShowsHelper
  def age_at_show(show)
    if show.date - current_user.birthdate < 0
      "You were not alive."
    else
      "You were #{distance_of_time_in_words(show.date,current_user.birthdate).sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old."
    end
  end

  def age_of_pit_at_show(show)
    "The youngest member of The Pit was #{distance_of_time_in_words(show.date,'1969-04-28').sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old."
  end

  def same_age_at_show?(show)
    distance_of_time_in_words(show.date, current_user.birthdate) == distance_of_time_in_words(show.date, '1969-04-28')
  end

end
