PEOPLE_LIST_PATH = 'people.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(PEOPLE_LIST_PATH) { |people| puts people }
end

def where(pattern)
  File.foreach(PEOPLE_LIST_PATH).with_index do |people, index|
    @people_id = index if people.include?(pattern)
  end

  @people_id
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  
  File.foreach(PEOPLE_LIST_PATH).with_index do |people, index|
    file.puts(id == index ? text : people)
  end

  file.close
  File.write(PEOPLE_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, "w")
  File.foreach(PEOPLE_LIST_PATH).with_index do |people, index|
      file.puts people if id != index
  end

  file.close
  File.write(PEOPLE_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def find(id)
  File.foreach(PEOPLE_LIST_PATH).with_index do |people, index|
    puts people if id == index
  end
end


