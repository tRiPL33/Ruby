INPUT_FILE_PATH = 'input.txt'
OUTPUT_FILE_PATH = 'result.txt'

def read_people
  input_file = File.open(INPUT_FILE_PATH)
  students = input_file.readlines.map(&:chomp)
  output_file = File.open(OUTPUT_FILE_PATH, "a")

  loop do
    break if students.size == 0

    puts 'Enter age of student'
    age = gets.to_i

    if age == -1
      puts 'You entered -1 (exit)'
      break
    end

    for stud in students
      File.write(OUTPUT_FILE_PATH, "#{stud}\n", mode:"a") if stud.include?("#{age}")
      students.delete(stud) if stud.include?("#{age}")
    end
  end

  output_file.close
  input_file.close

  File.foreach(OUTPUT_FILE_PATH){|student| puts student}
end

