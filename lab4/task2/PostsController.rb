load 'Resource.rb'

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, index|
      puts "id:#{index + 1} \"#{post}\""
    end
  end

  def show
    print "Enter index of post: "
    id = gets.to_i

    if id < 1
      puts "Incorrect id"
      id = gets.to_i
    end

    puts "id:#{id} \"#{@posts[id-1]}\""
  end

  def create
    print "Enter text of post: "
    post = gets.chomp

    @posts << post

    puts "Your post: #{post}\nindex: #{@posts.find_index(post) + 1} "
  end

  def update
    print "Enter index of post: "
    id = gets.to_i

    if id < 1
      puts "Incorrect id"
      id = gets.to_i
    end

    print "Old post \"#{@posts[id-1]}\" enter new post "
    new_post = gets.chomp

    @posts[id-1] = new_post
    index
  end

  def destroy
    print "Enter index of post: "
    id = gets.to_i

    if id < 1
      puts "Incorrect id"
      id = gets.to_i
    end

    @posts.delete_at(id -1)
  end
end
