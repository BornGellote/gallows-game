current_path =  File.dirname(__FILE__)
# current_path =  "./" + File.dirname(__FILE__) - if opened not main folder

require current_path + "/game.rb"
require current_path + "/resultprinter.rb"
require current_path + "/word_reader.rb"

priter = ResultPrinter.new
reader = WordReader.new

word = reader.read_from_file(current_path +  '/data/words.txt')

game = Game.new(word)

while game.status == 0 do
  priter.print_status(game)
  game.ask_next_letter
end

priter.print_status(game)