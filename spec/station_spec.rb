
describe Station do 
  
  subject(:station) { described_class.new("Liverpool Street") }

  it "has a name" do
    expect(station.name).to eq "Liverpool Street"
  end

end