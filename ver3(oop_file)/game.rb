class Game
  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @bad_letters = []
    @good_letters = []
    @status = 0
  end

  attr_reader :letters, :errors,  :good_letters, :bad_letters, :status

  def get_letters(word)
    if (word == nil || word == "")
      abort "Are you not entered word for game!"
    end

    return word.split("")
  end

  def ask_next_letter
    puts "\nEnter next word"

    letter = ""
    while letter == "" do
      letter = STDIN.gets.encode("UTF-8").chomp
    end

    next_step(letter)
  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      @good_letters << bukva

      if @good_letters.uniq.size == @letters.uniq.size
        @status = 1
      end
    else

      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end
end