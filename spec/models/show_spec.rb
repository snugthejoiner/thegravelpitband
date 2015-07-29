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

  # for the 'bill' method
  it "returns a bill listing other acts that played" do
    binding.pry
    place = FactoryGirl.create(:place)
    performance = FactoryGirl.create(:performance)
    show = Show.create(place_id: place.id, date: '1/1/2000')
    expect(show.bill).to eq(performance.act)
  end
  it "returns true if other acts played" # for the 'performance?' method
end
