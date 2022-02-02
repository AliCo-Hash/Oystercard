class Oystercard

    attr_reader :balance, :in_journey, :entry_station
    MAX_BALANCE = 90
    MIN_BALANCE = 1

    def initialize
        @balance = 0
        @in_journey = false
        @entry_station = nil
    end

    def top_up(value)
      fail 'Maximum balance of #{max_balance} exceeded' unless value + balance <= MAX_BALANCE
      @balance += value
    end

    def in_journey?
      !!entry_station
    end

    def touch_in(station)
      fail 'Card has less than minimum balance' unless balance >= MIN_BALANCE
      @entry_station = station 
    end

    def touch_out
      deduct(MIN_BALANCE)
      @entry_station = nil
    end

    private
    
    def deduct(value)
      @balance -= value
    end

end
