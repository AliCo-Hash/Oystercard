
describe Station do 
  
  subject(:station) { described_class.new("Liverpool Street", 1) }

  it "has a name" do
    expect(station.name).to eq "Liverpool Street"
  end

  it "shows the zone" do
    expect(station.zone).to eq 1
  end
end