require 'oystercard.rb'

describe Oystercard do

  let(:min_balance) {Oystercard::MIN_BALANCE}
  let(:max_balance) {Oystercard::MAX_BALANCE}
  
  let(:station) { double(:station, :name => "Liverpool Street") }

  subject(:oystercard) { described_class.new } 
  
  RSpec.shared_context "shared", :shared_context => :metadata do
    def top_up_touch_in
      oystercard.top_up(min_balance)
      oystercard.touch_in(station)
    end
  end

  include_context "shared"

  it 'should have a balance of zero' do
      expect(oystercard.balance).to eq(0)
  end

  describe '#top_up' do
    
    it 'should top up balance by value' do
      expect { oystercard.top_up 2 }.to change { oystercard.balance }.by 2
    end

    it 'should raise an error if maximum balance exceeded' do
      oystercard.top_up(max_balance)
      expect { oystercard.top_up 1 }.to raise_error('Maximum balance of #{max_balance} exceeded')
    end
  end

  describe '#in_journey?' do
    it 'is not on a journey' do
      expect(oystercard).not_to be_in_journey
    end

    it 'can touch in' do
      top_up_touch_in
      expect(oystercard).to be_in_journey
    end

    it 'can touch out' do
      top_up_touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it 'should raise an error if the balance is less than minimum balance' do
      expect { oystercard.touch_in(station) }.to raise_error('Card has less than minimum balance')
    end

    it 'should touch out minimum fare' do
      top_up_touch_in
      expect { oystercard.touch_out }.to change { oystercard.balance }.by(-min_balance)
    end

  end

  describe '#touch_in' do
    it "stores the station" do
      top_up_touch_in
      expect(oystercard.entry_station.name).to eq station.name
    end

  end

  describe '#touch_out' do
    it "" do
      top_up_touch_in
      oystercard.touch_out
      expect(oystercard.entry_station).to be_nil
    end
  end
end