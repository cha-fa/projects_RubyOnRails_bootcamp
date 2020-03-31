#c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie. 
require 'pry'
require_relative 'boardcase'
require 'terminal-table'


class Board
  attr_accessor :grid, :grid_line1, :grid_line2, :grid_line3, :boardcase


  def initialize
    @grid_line1 = []
    @grid_line1 << case_0 = Boardcase.new("1A")
    @grid_line1 << case_1 = Boardcase.new("2A")
    @grid_line1 << case_2 = Boardcase.new("3A")

    @grid_line2 = []
    @grid_line2 << case_3 = Boardcase.new("1B")
    @grid_line2 << case_4 = Boardcase.new("2B")
    @grid_line2 << case_5 = Boardcase.new("3B")

    @grid_line3 = []
    @grid_line3 << case_6 = Boardcase.new("1C")
    @grid_line3 << case_7 = Boardcase.new("2C")
    @grid_line3 << case_8 = Boardcase.new("3C")

    @grid = []
    @grid << @grid_line1
    @grid << @grid_line2
    @grid << @grid_line3

    # @grid = [[1A,2A,3A],[1B,2B,3B],[1C,2C,3C]]
  end

  def show_presentation_board
    table = Terminal::Table.new do |t| 
      t << [grid_line1[0].position, grid_line1[1].position, grid_line1[2].position]
      t << :separator
      t.add_row [grid_line2[0].position, grid_line2[1].position, grid_line2[2].position]
      t.add_separator
      t.add_row [grid_line3[0].position, grid_line3[1].position, grid_line3[2].position]
    end
    puts "Voici le plateau de jeu et les coordonnées des cases :"
    puts table
  end

  def show_ongoing_game_board
    table_ongoing = Terminal::Table.new do |t| 
      t << [grid_line1[0].case_state, grid_line1[1].case_state, grid_line1[2].case_state]
      t << :separator
      t.add_row [grid_line2[0].case_state, grid_line2[1].case_state, grid_line2[2].case_state]
      t.add_separator
      t.add_row [grid_line3[0].case_state, grid_line3[1].case_state, grid_line3[2].case_state]
    end  
    puts "Partie en cours :" 
    puts table_ongoing
  end

  def x_is_winner?
    if grid[0][0].case_state == "X" && grid[0][1].case_state == "X" && grid[0][2].case_state == "X"  #première ligne horizontale
      return true
    elsif grid[1][0].case_state == "X" && grid[1][1].case_state == "X" && grid[1][2].case_state == "X" #deuxième ligne horizontale
      return true
    elsif grid[2][0].case_state == "X" && grid[2][1].case_state == "X" && grid[2][2].case_state == "X" #troisieme ligne horizontale
      return true
    elsif grid[0][0].case_state == "X" && grid[1][0].case_state == "X" && grid[2][0].case_state == "X" #première colonne
      return true
    elsif grid[0][1].case_state == "X" && grid[1][1].case_state == "X" && grid[2][1].case_state == "X" #deuxième colonne
      return true
    elsif grid[0][2].case_state == "X" && grid[1][2].case_state == "X" && grid[2][2].case_state == "X" #troisième colonne
      return true
    elsif grid[0][0].case_state == "X" && grid[1][1].case_state == "X" && grid[2][2].case_state == "X" #diagonale gauche haut à bas droite
      return true
    elsif grid[0][2].case_state == "X" && grid[1][1].case_state == "X" && grid[2][0].case_state == "X" #diagonale droite haut à bas gauche
      return true
    else 
      return false
    end
  end

  def o_is_winner?
    if grid[0][0].case_state == "O" && grid[0][1].case_state == "O" && grid[0][2].case_state == "O"  #première ligne horizontale
      return true
    elsif grid[1][0].case_state == "O" && grid[1][1].case_state == "O" && grid[1][2].case_state == "O" #deuxième ligne horizontale
      return true
    elsif grid[2][0].case_state == "O" && grid[2][1].case_state == "O" && grid[2][2].case_state == "O" #troisieme ligne horizontale
      return true
    elsif grid[0][0].case_state == "O" && grid[1][0].case_state == "O" && grid[2][0].case_state == "O" #première colonne
      return true
    elsif grid[0][1].case_state == "O" && grid[1][1].case_state == "O" && grid[2][1].case_state == "O" #deuxième colonne
      return true
    elsif grid[0][2].case_state == "O" && grid[1][2].case_state == "O" && grid[2][2].case_state == "O" #troisième colonne
      return true
    elsif grid[0][0].case_state == "O" && grid[1][1].case_state == "O" && grid[2][2].case_state == "O" #diagonale gauche haut à bas droite
      return true
    elsif grid[0][2].case_state == "O" && grid[1][1].case_state == "O" && grid[2][0].case_state == "O" #diagonale droite haut à bas gauche
      return true
    else 
      return false
    end
  end

  def game_over?
    if o_is_winner? == false && x_is_winner? == false && grid[0][0].case_state != " " && grid[0][1].case_state != " " && grid[1][0].case_state != " " && grid[1][1].case_state != " " && grid[1][2].case_state != " " && grid[2][0].case_state != " " && grid[2][1].case_state != " " && grid[2][2].case_state != " "
    return true
      # puts "Le jeu est terminé, il n'y a pas de gagnants" 
    end
  end


end



