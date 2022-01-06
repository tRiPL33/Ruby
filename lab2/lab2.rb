def checkCS
  print ("Enter word ")
  word = gets.chomp

  word[-2..-1] == "CS" ? (p (2 ** word.length)) : (p (word.reverse))
end

def pokemons
  print ("How many pokemons create? ")
  number_of_pokemons = gets.to_i

  pokemons = []

  number_of_pokemons.times do
    print ("Enter name of pokemon ")
    name = gets.chomp
    print ("Enter color of pokemon ")
    color = gets.chomp
    pokemons << { name => color }
  end

  p pokemons
end
