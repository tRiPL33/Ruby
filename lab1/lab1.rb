def greeting
    print ("Enter your name ")
    name = gets.chomp

    print ("Enter your surname ")
    surname= gets.chomp

    print ("How old are you? ")
    age = gets.to_i

    if age < 18
      p "Hi, #{name} #{surname}. You are less then 18, but starting programming is never early"
    else
      p "Hello, #{name} #{surname}. It's time to get busy"
    end
end

def foobar
  number = 20

  print ("Enter first number ")
  number1 = gets.to_i

  print ("Enter second number ")
  number2 = gets.to_i

  if number1 == number  or number2 == number
    p number2
  else
    p number1 + number2
  end
end

greeting()
foobar()
