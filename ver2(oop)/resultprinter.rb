class ResultPrinter

  def print_status(game)
    cls

    puts "\n Word: " + get_word_for_print(game.letters, game.good_letters)
    puts "Errors (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_gallows(game.errors)

    if game.errors >= 7
      puts "Are you lose! :)"
    else
      if game.letters.uniq.size == game.good_letters.size
        puts "Congratulation! Are you win \m/ \n\n"
      else
        puts "You have " + ( 7 - game.errors ).to_s + " of attempts"
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    for letter in letters do
      if good_letters.include? letter
        result += letter + " "
      else
        result += "__ "
      end
    end

    return result
  end

  def cls
    system "clear" or system "cls"
  end

  def print_gallows(errors)
    case errors
      when 0
        puts "
              ________
              |/
              |
              |
              |
              |
              |
              |
              |
              |
            __|_______________
            |                |
         "
      when 1
        puts "
              ________
              |/
              |     ( )
              |
              |
              |
              |
              |
              |
              |
            __|_______________
            |                |
         "
      when 2
        puts "
              ________
              |/
              |     ( )
              |      |
              |
              |
              |
              |
              |
              |
            __|_______________
            |                |
         "
      when 3
        puts "
              ________
              |/
              |     ( )
              |      |_
              |        \\
              |
              |
              |
              |
              |
            __|_______________
            |                |
         "
      when 4
        puts "
              ________
              |/
              |     ( )
              |     _|_
              |    /   \\
              |
              |
              |
              |
              |
            __|_______________
            |                |
         "
      when 5
        puts "
              ________
              |/
              |     ( )
              |     _|_
              |    / | \\
              |      |
              |
              |
              |
              |
            __|_______________
            |                |
         "
      when 6
        puts "
              ________
              |/
              |     ( )
              |     _|_
              |    / | \\
              |      |
              |     / \\
              |    /   \\
              |
              |
            __|_______________
            |                |
         "
      when 7
        puts "
              ________
              |/     |
              |     (_)
              |     _|_
              |    / | \\
              |      |
              |     / \\
              |    /   \\
              |
              |
            __|_______________
            |                |
         "
    end
  end

end