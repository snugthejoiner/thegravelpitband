require 'rails_helper'

describe Show, type: :model do

  it "fails to validate without a date" do
    bad_date = Show.create(place_id: 7)
    expect { bad_date.save! }.to raise_error 
    bad_date.errors.messages[:date].first.should == "can't be blank"
  end
  
  # for the 'description' method
  it "returns a description of the venue and its location" do
    place = FactoryGirl.create(:place)
    show = Show.create(place_id: place.id, date: '1/1/2000')
    expect(show.description).to eq("TT The Bear's Place in Cambridge, MA")
  end

  # for the 'description' method with blank city
  it "returns a description of the venue and its location" do
    place = FactoryGirl.create(:place, city: nil)
    show = Show.create(place_id: place.id, date: '1/1/2000')
    expect(show.description).to eq("TT The Bear's Place , MA")
  end

  # for the 'description' method with blank state
  it "returns a description of the venue and its location" do
    place = FactoryGirl.create(:place, state: nil)
    show = Show.create(place_id: place.id, date: '1/1/2000')
    expect(show.description).to eq("TT The Bear's Place in Cambridge")
  end

    # for the 'description' method with a street address
  it "returns a description of the venue and its location" do
    place = FactoryGirl.create(:place, address: '10 Brookline Ave')
    show = Show.create(place_id: place.id, date: '1/1/2000')
    expect(show.description).to eq("TT The Bear's Place 10 Brookline Ave in Cambridge, MA")
  end

  # for the 'bill' method
  it "returns a bill listing other acts that played" do
    place = FactoryGirl.create(:place)
    act = FactoryGirl.create(:act)
    show = Show.create(place_id: place.id, date: '1/1/2000')
    performance = Performance.create(show_id: show.id, act_id: act.id)
    expect(show.bill).to eq(performance.act.name)
  end

  # for the 'performances?' method
  it "returns true if other acts played" do
    place = FactoryGirl.create(:place)
    act = FactoryGirl.create(:act)
    show = Show.create(place_id: place.id, date: '1/1/2000')
    performance = Performance.create(show_id: show.id, act_id: act.id)
    expect(show.performances?).to eq(true)
  end
  # it "returns true if other acts played" do # for the 'performance?' method
  # end
end
