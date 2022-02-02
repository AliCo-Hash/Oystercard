require_relative '../lib/station'
# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

describe "User Story 8" do
  it "stores the station" do
    oyster_card = Oystercard.new
    oyster_card.top_up(1)
    station = Station.new("Liverpool Street")
    oyster_card.touch_in(station)
    expect(oyster_card.entry_station.name).to eq "Liverpool Street"
  end
  
  it 'set entry station to nil on touch out' do
    oyster_card = Oystercard.new
    oyster_card.top_up(1)
    station = Station.new("Liverpool Street")
    oyster_card.touch_in(station)
    oyster_card.touch_out
    expect(oyster_card.entry_station).to be_nil
  end
end