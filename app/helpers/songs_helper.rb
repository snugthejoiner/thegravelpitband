module SongsHelper

  def song_art(song)
    if song.title == "Angry Words"
      "angry.jpg"
    elsif song.title == "Anyone, Anything, Everything"
      "anyone.jpg"
    elsif song.title == "Set The Controls For Endless Summer"
      "controls.jpg"
    elsif song.title == "Crybaby Vampire"
      "crybaby.jpg"
    elsif song.title == "Don't Do What You're Dying To Do"
      "dont.jpg"
    elsif song.title == "Gravesend Eventide"
      "eventide.jpg"
    elsif song.title == "Hungry Fox"
      "hungry.jpg"
    elsif song.title == "Triple Little Man"
      "little.jpg"
    elsif  song.title == "Mr. Baby"
      "baby.jpg"
    elsif song.title == "Monomaniac"
      "monomaniac.jpg"
    elsif song.title == "Power Broker Blues"
      "power.jpg"
    elsif  song.title == "Stingray"
      "stingray.jpg"
    elsif  song.title == "The Wreck of the Triple One"
      "triple.jpg"
    elsif  song.title == "Glimpses of the Underdog"
      "underdog.jpg"
    else
      nil
    end
  end


end
