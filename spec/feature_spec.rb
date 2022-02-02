require_relative '../lib/station'
# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

describe "User Story 8" do
  it "stores the station on touch in" do
    oyster_card = Oystercard.new
    oyster_card.top_up(1)
    station = Station.new("Liverpool Street", 1)
    oyster_card.touch_in(station)
    expect(oyster_card.entry_station.name).to eq "Liverpool Street"
  end

  it 'set entry station to nil on touch out' do
    oyster_card = Oystercard.new
    oyster_card.top_up(1)
    station = Station.new("Liverpool Street", 1)
    oyster_card.touch_in(station)
    exit_station = Station.new("Holborn", 2)
    oyster_card.touch_out(exit_station)
    expect(oyster_card.entry_station).to be_nil
  end
end

# In order to know where I have been
# As a customer
# I want to see all my previous trips

describe "User Story 9" do
  it "store the station on touch out" do
    oyster_card = Oystercard.new
    oyster_card.top_up(1)
    entry_station = Station.new("Liverpool Street", 1)
    oyster_card.touch_in(entry_station)
    exit_station = Station.new("Holborn", 2)
    oyster_card.touch_out(exit_station)
    expect(oyster_card.exit_station.name).to eq "Holborn"
  end

  it 'stores the journey history' do
    oyster_card = Oystercard.new
    oyster_card.top_up(1)
    entry_station = Station.new("Liverpool Street", 1)
    oyster_card.touch_in(entry_station)
    exit_station = Station.new("Holborn", 2)
    oyster_card.touch_out(exit_station)
    expect(oyster_card.journey_history).to include("Liverpool Street" => "Holborn")
  end
end

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in
describe "User Story 10" do
  xit "shows the zone" do
    station = Station.new("Liverpool Street", 1)
    expect(station.zone).to eq 1
  end
end
