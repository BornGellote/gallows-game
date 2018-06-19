class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0
    while counter <= 7 do
      file_name = current_path + "/image/#{counter}.txt"

      if File.exists?(file_name)
        f = File.new(file_name, 'r:UTF-8')
        @status_image << f.read
        f.close
      else
        @status_image << "\n Image not find \n"
      end

      counter += 1
    end
  end

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
    puts @status_image[errors]
  end

end