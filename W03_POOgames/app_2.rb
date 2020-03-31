require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#introduction
puts "====================================================="
puts "||    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    ||"
puts "|| Le but du jeu est d'être le dernier survivant ! ||"
puts "====================================================="

#initialisation du joueur humain
puts "Quel est ton blase de guerrier ?"
print ">" 
user = HumanPlayer.new(gets.chomp) 

#initialisation des ennemis organisés en arrays
enemies = []
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")

#lancement de la boucle de combat jusqu'à ce qu'il n'est reste qu'un
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts " "
  puts user.show_state
  puts " "

#menu d'actions 
  puts "Quelle action veux-tu effectuer ?"
  puts "Chercher une meilleure arme : tape 'a'"
  puts "Chercher à se soigner : tape 's'"
  puts "Attaquer un joueur en vue :"
  if player1.life_points > 0 #proposer que des ennemis encore en vie
    puts "#{player1.show_state} : tape '0' pour l'attaquer"
  end
  if player2.life_points > 0 #proposer que des ennemis encore en vie
    puts "#{player2.show_state} : tape '1' pour l'attaquer"
  end

#réponse user
  puts " "
  puts "#########"
  puts "Ton choix"
  puts "#########"

  print ">"

  choice = gets.chomp
  if choice == "a" 
    user.search_weapon
  elsif choice == "s"
    user.search_health_pack
  elsif choice == "0"
    user.attacks(player1)
  elsif choice == "1"
    user.attacks(player2)
  else 
    puts "Il faut choisir entre : a, s, 0 ou 1"
  end
  puts" "

  # contre-attaque des ennemis
  enemies.each do |enemy| #chaque ennemi de l'array doit attaquer
    if enemy.life_points > 0 #mais que s'il est encore vivant
      puts "Les autres joueurs t'attaquent !"
    enemy.attacks(user)
    end
  end

end

# annonce du résultat
puts "============================="
puts "|| La partie est terminée. ||"

if user.life_points > 0
  puts "||    GG ! Tu as gagné !   ||"
else
  puts "||  Loser, tu es mort !   ||"
end
puts "============================="


