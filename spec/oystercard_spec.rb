require 'oystercard.rb'

describe Oystercard do
  let(:min_balance) {Oystercard::MIN_BALANCE}
  let(:max_balance) {Oystercard::MAX_BALANCE}

    it 'should have a balance of zero' do
        expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'should top up balance by value' do
        expect { subject.top_up 2 }.to change { subject.balance }.by 2
      end

      it 'should raise an error if maximum balance exceeded' do
        subject.top_up(max_balance)
        expect { subject.top_up 1 }.to raise_error('Maximum balance of #{max_balance} exceeded')
      end
    end

    describe '#in_journey?' do
      it 'is not on a journey' do
        expect(subject).not_to be_in_journey
      end

      it 'can touch in' do
        subject.top_up(min_balance)
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it 'can touch out' do
        subject.top_up(min_balance)
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it 'should raise an error if the balance is less than minimum balance' do
        expect { subject.touch_in }.to raise_error('Card has less than minimum balance')
      end

      it 'should touch out minimum fare' do
        subject.top_up(min_balance)
        subject.touch_in
        expect { subject.touch_out }.to change { subject.balance }.by(-min_balance)
      end

    end

end