require 'bundler'
Bundler.require

require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'boardcase'

class Application 
  attr_accessor :game, :board

  def game_start
    puts "Joueur 1, quel est ton nom ?".colorize(:cyan)
    print ">"
    name_1 = gets.chomp

    puts "#{name_1}, avec quel symbole veux-tu jouer : X ou O ?".colorize(:cyan)
    user_answer_symbol = gets.chomp
    until user_answer_symbol == "X" || user_answer_symbol == "O"
      puts "Il faut choisir entre X comme 'Xavier' ou O comme 'Olivier' : ".colorize(:magenta)
      user_answer_symbol = gets.chomp
    end
    case user_answer_symbol
    when "X"
      symbol_1 = "X"
      symbol_2 = "O"
    when "O"
      symbol_1 = "O"
      symbol_2 = "X"
    end


    puts "Joueur 2, quel est ton nom ?".colorize(:cyan)
    name_2 = gets.chomp
    puts "#{name_1} a choisir de jouer avec #{symbol_1}, tu joueras donc avec #{symbol_2}".colorize(:cyan)

    @game = Game.new(name_1, name_2, symbol_1, symbol_2)

    game.board.show_presentation_board

  end

  def game_itself
    until game.board.game_over? == true || game.board.o_is_winner? == true || game.board.x_is_winner? == true
      @game.show_presentation_during_game
      @game.round_of_player_one
      @game.board.show_ongoing_game_board
      break if game.board.game_over? == true || game.board.o_is_winner? == true || game.board.x_is_winner? == true
      @game.show_presentation_during_game
      @game.round_of_player_two
      @game.board.show_ongoing_game_board


    end
  end

  def game_end
    if game.board.game_over? == true
      puts "Le jeu est terminé, c'est un ex-aequo !".colorize(:blue)
    elsif game.board.o_is_winner? == true
      if game.players[0].symbol == "O"
        puts "C'est #{game.players[0].name} qui a gagné".colorize(:blue)
        puts ".########..########.....###....##.....##..#######.....####".colorize(:blue)
        puts ".##.....##.##.....##...##.##...##.....##.##.....##....####".colorize(:blue)
        puts ".##.....##.##.....##..##...##..##.....##.##.....##....####".colorize(:blue)
        puts ".########..########..##.....##.##.....##.##.....##.....##.".colorize(:blue)
        puts ".##.....##.##...##...#########..##...##..##.....##........".colorize(:blue)
        puts ".##.....##.##....##..##.....##...##.##...##.....##....####".colorize(:blue)
        puts ".########..##.....##.##.....##....###.....#######.....####".colorize(:blue)
      else 
        puts "C'est #{game.players[1].name} qui a gagné".colorize(:blue)
        puts ".########..########.....###....##.....##..#######.....####".colorize(:blue)
        puts ".##.....##.##.....##...##.##...##.....##.##.....##....####".colorize(:blue)
        puts ".##.....##.##.....##..##...##..##.....##.##.....##....####".colorize(:blue)
        puts ".########..########..##.....##.##.....##.##.....##.....##.".colorize(:blue)
        puts ".##.....##.##...##...#########..##...##..##.....##........".colorize(:blue)
        puts ".##.....##.##....##..##.....##...##.##...##.....##....####".colorize(:blue)
        puts ".########..##.....##.##.....##....###.....#######.....####".colorize(:blue)
      end
    else
      if game.players[0].symbol == "X"
        puts "C'est #{game.players[0].name} qui a gagné".colorize(:blue)
        puts ".########..########.....###....##.....##..#######.....####".colorize(:blue)
        puts ".##.....##.##.....##...##.##...##.....##.##.....##....####".colorize(:blue)
        puts ".##.....##.##.....##..##...##..##.....##.##.....##....####".colorize(:blue)
        puts ".########..########..##.....##.##.....##.##.....##.....##.".colorize(:blue)
        puts ".##.....##.##...##...#########..##...##..##.....##........".colorize(:blue)
        puts ".##.....##.##....##..##.....##...##.##...##.....##....####".colorize(:blue)
        puts ".########..##.....##.##.....##....###.....#######.....####".colorize(:blue)
      else 
        puts "C'est #{game.players[1].name} qui a gagné".colorize(:blue)
        puts ".########..########.....###....##.....##..#######.....####".colorize(:blue)
        puts ".##.....##.##.....##...##.##...##.....##.##.....##....####".colorize(:blue)
        puts ".##.....##.##.....##..##...##..##.....##.##.....##....####".colorize(:blue)
        puts ".########..########..##.....##.##.....##.##.....##.....##.".colorize(:blue)
        puts ".##.....##.##...##...#########..##...##..##.....##........".colorize(:blue)
        puts ".##.....##.##....##..##.....##...##.##...##.....##....####".colorize(:blue)
        puts ".########..##.....##.##.....##....###.....#######.....####".colorize(:blue)
      end
    end
  end

  def game_restart
    puts "Voulez-vous rejouer ? [Y/N]".colorize(:white)
    user_answer = gets.chomp
    case user_answer
    when "Y"
      until user_answer == "N"
        game_start
        game_itself
        game_end
        puts "Voulez-vous rejouer ? [Y/N]".colorize(:white)
        user_answer = gets.chomp
      end
      puts "Bye !".colorize(:blue)
    when "N"
      puts "Bye !".colorize(:blue)
    end
  end

  def welcome_message
puts ".########..####.########.##....##.##.....##.########.##....##.##.....##.########".colorize(:color => :magenta)
puts ".##.....##..##..##.......###...##.##.....##.##.......###...##.##.....##.##......".colorize(:color => :magenta)
puts ".##.....##..##..##.......####..##.##.....##.##.......####..##.##.....##.##......".colorize(:color => :magenta)
puts ".########...##..######...##.##.##.##.....##.######...##.##.##.##.....##.######..".colorize(:color => :magenta)
puts ".##.....##..##..##.......##..####..##...##..##.......##..####.##.....##.##......".colorize(:color => :magenta)
puts ".##.....##..##..##.......##...###...##.##...##.......##...###.##.....##.##......".colorize(:color => :magenta)
puts ".########..####.########.##....##....###....########.##....##..#######..########".colorize(:color => :magenta)
  end

end