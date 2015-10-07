module ReleasesHelper
  def age_when_released(release)
    if release.release_date - current_user.birthdate < 0
      "This was released before you were alive."
    else
      "You were #{distance_of_time_in_words(release.release_date,current_user.birthdate).sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old when this was released."
    end
  end

  def cover_art(release)
    if release.title == "Serpent Umbrella"
      "serpent_umbrella.jpg"
    elsif release.title == "The Serpent Extrackaganza"
      "serpent_extrackaganza.jpg"
    elsif release.title == "Mass Avenue Freeze-Out"
      "mass_avenue_freeze_out.jpg"
    elsif  release.title == "Silver Gorilla"
      "silver_gorilla.jpg"
    elsif  release.title == "The Gravel Pit Manifesto"
      "the_gravel_pit_manifesto.jpg"
    elsif  release.title == "No One Here Gets In For Free"
      "no_one.jpg"
    elsif  release.title == "Favorite (4 song)"
      "favorite.jpg"
    else
      "crash_land.jpg"
    end
  end

  def purchase_link(release)
    if release.title == "Serpent Umbrella"
      "http://thegravelpit.bandcamp.com/releases"
    elsif release.title == "The Serpent Extrackaganza"
      "http://thegravelpit.bandcamp.com/releases"
    elsif release.title == "Mass Avenue Freeze-Out"
      "http://q-dee.com/album/mass-avenue-freeze-out"
    elsif  release.title == "Silver Gorilla"
      "http://q-dee.com/album/the-silver-gorilla"
    elsif  release.title == "The Gravel Pit Manifesto"
      "http://q-dee.com/album/the-gravel-pit-manifesto"
    elsif  release.title == "No One Here Gets In For Free"
      "http://q-dee.com/album/no-one-here-gets-in-for-free"
    elsif  release.title == "Favorite (4 song)"
      "http://q-dee.com/album/favorite-ep"
    else
      "http://q-dee.com/album/crash-land"
    end
  end

end

