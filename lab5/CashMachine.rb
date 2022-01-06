class CashMachine
  def initialize
    @balance = File.read("./balance.txt").to_f
  end

  def balance
    @balance
  end

  def deposit(value)
    value = value.to_f

    if value >= 0
      @balance = @balance + value
      write_to_file
      0
    else
      -1
    end
  end

  def withdraw(value)
    value = value.to_f

    if value <= @balance
      @balance = @balance - value
      write_to_file
      0
    else
      -1
    end
  end

  private

  def write_to_file
    File.write("./balance.txt", @balance, mode: "w")
  end
end
