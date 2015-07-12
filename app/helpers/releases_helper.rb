module ReleasesHelper
  def age_when_released(release)
    if release.release_date - current_user.birthdate < 0
      "This was released before you were alive."
    else
      "You were #{distance_of_time_in_words(release.release_date,current_user.birthdate).sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old when this was released."
    end
  end
end
