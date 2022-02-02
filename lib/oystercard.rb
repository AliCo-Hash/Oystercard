class Oystercard

    attr_reader :balance, :in_journey
    MAX_BALANCE = 90
    MIN_BALANCE = 1

    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(value)
      fail 'Maximum balance of #{max_balance} exceeded' unless value + balance <= MAX_BALANCE
      @balance += value
    end

    def in_journey?
      @in_journey
    end

    def touch_in
      fail 'Card has less than minimum balance' unless balance >= MIN_BALANCE
      @in_journey = true
    end

    def touch_out
      deduct(MIN_BALANCE)
      @in_journey = false
    end

    private
    
    def deduct(value)
      @balance -= value
    end

end
