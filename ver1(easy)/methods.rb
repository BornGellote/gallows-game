def get_letters
  word =  ARGV[0]

  if Gem.win_platform? && ARGV[0]
    word = word.encode( ARGV[0].encoding, "cp1251" ).encode("UTF-8")
  end

  if (word == nil || word == "")
    abort "Are you not entered word for game!"
  end

  return word.split("")
end
# puts get_letters.to_s - check get_letters

def get_user_input
  letter = ""

  while letter == "" do
    letter = STDIN.gets.encode("UTF-8").chomp
  end

  return letter
end

def check_result(user_input, letters, good_letters, bad_letters)
    if good_letters.include?(user_input) || bad_letters.include?(user_input)
      return 0
    end

  if letters.include? user_input
    good_letters << user_input

    #uniq - уникаьный
    if letters.uniq.size == good_letters.size
      return 1
    else
      return 0
    end
  else
    bad_letters << user_input
    return -1
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

def print_status(letters, good_letters, bad_letters, errors)
  puts "\n Word: " + get_word_for_print(letters, good_letters)

  puts "Errors (#{errors}): #{bad_letters.join(", ")}"

  if errors >= 7
    puts "Are you lose! :)"
  else
    if letters.uniq.size == good_letters.size
      puts "Congratulation! Are you win \n\n"
    else
      puts "You have " + ( 7 - errors ).to_s + " of attempts"
    end
  end
end

def cls
  system "clear" or system "cls"
end