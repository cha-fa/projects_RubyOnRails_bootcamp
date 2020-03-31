require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#introduction
puts "====================================================="
puts "||    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    ||"
puts "|| Le but du jeu est d'être le dernier survivant ! ||"
puts "====================================================="

#initialisation du joueur humain + des ennemis
puts "Quel est ton blase de guerrier ?"
print ">" 
my_game = Game.new(gets.chomp)

#début de la grande boucle
while my_game.human_player.life_points > 0 && my_game.enemies.length > 0 
  puts " "
  puts my_game.human_player.show_state
  puts " "

  #menu
  puts my_game.menu

  #réponse user
  puts " "
  puts "#########"
  puts "Ton choix"
  puts "#########"

  print ">"
  choice = gets.chomp
  my_game.menu_choice(choice)

  #contre attaque des ennemis
  my_game.enemies_attack
end
  #message de fin
  my_game.end






# binding.pry