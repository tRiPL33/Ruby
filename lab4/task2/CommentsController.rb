load 'Resource.rb'

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each.with_index do |comment, index|
      puts "id:#{index + 1} \"#{comment}\""
    end
  end

  def show
    print "Enter index of comment: "
    id = gets.to_i

    if id < 1
      puts "Incorrect id"
      id = gets.to_i
    end

    puts "id:#{id} \"#{@comments[id-1]}\""
  end

  def create
    print "Enter text of comment: "
    comment = gets.chomp

    @comments << comment

    puts "Your comment: #{comment}\nindex: #{@comments.find_index(comment) + 1} "
  end

  def update
    print "Enter index of comment: "
    id = gets.to_i

    if id < 1
      puts "Incorrect id"
      id = gets.to_i
    end

    print "Old comment \"#{@comments[id-1]}\" enter new comment "
    new_comment = gets.chomp

    @comments[id-1] = new_comment
    index
  end

  def destroy
    print "Enter index of comment: "
    id = gets.to_i

    if id < 1
      puts "Incorrect id"
      id = gets.to_i
    end

    @comments.delete_at(id -1)
  end
end
