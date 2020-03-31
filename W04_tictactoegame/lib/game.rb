#c'est le jeu. Elle initialise tout, lance une partie (qui se termine avec 
#une victoire ou un nul), permet de jouer un tour, de chercher si la partie est finie, etc.
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'boardcase'

class Game
  attr_accessor :round, :players, :board

  def initialize(name_1, name_2, symbol_1, symbol_2)
    @board = Board.new
    @players = []
    @players << player_1 = Player.new(name_1, symbol_1)
    @players << player_2 = Player.new(name_2, symbol_2)
    round = 0
  end

  def round_of_player_one

    puts "#{players[0].name} sur quelle case veux-tu jouer ?".colorize(:cyan)
    user_choice = gets.chomp
    case user_choice
    when "1A"
      if board.grid[0][0].case_state == " "
        return board.grid[0][0].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "2A"
      if board.grid[0][1].case_state == " "
        return board.grid[0][1].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "3A"
      if board.grid[0][2].case_state == " "
        return board.grid[0][2].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "1B"
      if board.grid[1][0].case_state == " "
        return board.grid[1][0].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "2B"
      if board.grid[1][1].case_state == " "
        return board.grid[1][1].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "3B"
      if board.grid[1][2].case_state == " "
        return board.grid[1][2].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "1C"
      if board.grid[2][0].case_state == " "
        return board.grid[2][0].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "2C"
      if board.grid[2][1].case_state == " "
        return board.grid[2][1].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "3C"
      if board.grid[2][2].case_state == " "
        return board.grid[2][2].case_state = players[0].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    end
  end

  def round_of_player_two
    #demander au joueur la position qu'il veut
    #le joueur choisi
    #remplir la case avec le bon symbol
    #afficher le nouveau board
    puts "#{players[1].name} sur quelle case voulez-vous jouer ?".colorize(:cyan)
    user_choice = gets.chomp
    case user_choice
    when "1A"
      if board.grid[0][0].case_state == " "
        return board.grid[0][0].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "2A"
      if board.grid[0][1].case_state == " "
        return board.grid[0][1].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "3A"
      if board.grid[0][2].case_state == " "
        return board.grid[0][2].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "1B"
      if board.grid[1][0].case_state == " "
        return board.grid[1][0].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "2B"
      if board.grid[1][1].case_state == " "
        return board.grid[1][1].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "3B"
      if board.grid[1][2].case_state == " "
        return board.grid[1][2].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "1C"
      if board.grid[2][0].case_state == " "
        return board.grid[2][0].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "2C"
      if board.grid[2][1].case_state == " "
        return board.grid[2][1].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    when "3C"
      if board.grid[2][2].case_state == " "
        return board.grid[2][2].case_state = players[1].symbol
      else 
        puts "La case est déjà prise, DOMMAGE ! Tu passes ton tour !".colorize(:magenta)
      end
    end
  end

  def show_presentation_during_game
    puts "Revoir la grille des coordonnées ? [Y/N]".colorize(:white)
    user_choice_review = gets.chomp
    case user_choice_review
    when "Y"
      board.show_presentation_board
    end
  end

end