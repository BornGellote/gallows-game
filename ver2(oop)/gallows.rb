require "./game.rb"
require "./resultprinter.rb"

priter = ResultPrinter.new

word = ARGV[0]
if Gem.win_platform? && ARGV[0]
  word = word.encode( ARGV[0].encoding, "cp1251" ).encode("UTF-8")
end

game = Game.new(word)

while game.status == 0 do
  priter.print_status(game)
  game.ask_next_letter
end

priter.print_status(game)