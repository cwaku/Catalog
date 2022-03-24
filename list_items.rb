module ListItems
  def list_labels
    puts 'Empty labels list' if @books.empty?
    @books.each_with_index do |book, i|
      puts "#{i + 1}. Label: #{book.label.title}, Color: #{book.label.color}"
    end
  end

  def add_book
    puts 'Enter the book title:'
    title = gets.chomp
    puts 'Enter the book publisher:'
    publisher = gets.chomp
    puts 'Enter the book cover state (good or bad):'
    cover_state = gets.chomp
    puts 'Enter the book publish date(YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Enter label title:'
    label_title = gets.chomp
    puts 'Enter label color:'
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    book = Book.new(title, publisher, cover_state, publish_date)
    book.label = new_label

    @books.push(book)
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Empty books list' if @books.empty?
    @books.each_with_index do |book, i|
      puts "#{i + 1}. Title: #{book.title}, Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end

  def list_authors
    if @games.empty?
      puts 'Author list is empty'
      return
    end

    @games.each_with_index do |game, i|
      puts "#{i + 1}. First name: #{game.author.first_name}, Last name: #{game.author.last_name}"
    end
  end

  def add_game
    puts 'Enter multiplayer: '
    multiplayer = gets.chomp

    puts 'Enter the last played date [YYYY-MM-DD]: '
    last_played_at = gets.chomp

    puts 'Enter the publish date [YYYY-MM-DD]: '
    publish_date = gets.chomp

    puts 'Enter the author first name: '
    first_name = gets.chomp

    puts 'Enter the author last name: '
    last_name = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    game.author = Author.new(first_name, last_name)

    @games << game
    puts 'Game added successfully!'
  end

  def list_games
    if @games.empty?
      puts 'No games added!'
      return
    end

    @games.each_with_index do |game, i|
      # rubocop:disable Metrics/Layout/LineLength
      puts "#{i + 1}. Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
      # rubocop:enable Metrics/Layout/LineLength
    end
  end
end
