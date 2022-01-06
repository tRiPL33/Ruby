DEFAULT_BALANCE = 100.0
BALANCE_FILE_PATH = 'balance.txt'

def balance
  puts "Balance is #{@balance}"
end

def deposit
  print "Enter the amount for deposit "
  amount = gets.to_f

  if amount < 0
    puts "amount should be > 0"
    amount = gets.to_f
  else
    @balance += amount
  end
end

def withdraw
  print "Enter the amount for withdraw "
  amount = gets.to_f

  if amount < 0 || amount > @balance
    puts "Amount should be > 0 and < balance"
    amount = gets.to_f
  else
    @balance -= amount
  end
end

def start()
  if File.zero?(BALANCE_FILE_PATH)
    @balance = DEFAULT_BALANCE
  else
    @balance = File.readlines(BALANCE_FILE_PATH).first.chomp.to_f
  end

  puts "Your balance is #{@balance} press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)"

  loop do
    input = gets

    case input
    when "q\n"
      break
    when "b\n"
      balance
    when "w\n"
      withdraw
    when "d\n"
      deposit
    end

    puts "press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)"
  end

  File.write(BALANCE_FILE_PATH, @balance)
end