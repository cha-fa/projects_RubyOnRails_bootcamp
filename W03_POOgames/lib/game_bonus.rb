require_relative 'player'

class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @players_left = 10
    @enemies_in_sight = []
  end

  def new_players_in_sight
    if enemies_in_sight.length == players_left
      puts "Tous les joueurs sont déjà en vue"
    else
      dice = rand(1..6)
      if dice == 1
        puts "Aucun adversaire n'entre en jeu"
      elsif dice >= 2 && dice <= 4
        puts "Un adversaire entre en jeu"
        new_player = "joueur_" + rand(1000...9999)
        enemies_in_sight << Player.new(new_player)
      else
        puts "Deux adversaires entrent en jeu"
        new_player1 = "joueur_" + "#{rand(1000...9999)}"
        new_player2 = "joueur_" + "#{rand(1000...9999)}"
        enemies_in_sight << Player.new(new_player1)
        enemies_in_sight << Player.new(new_player2)
      end
    end
  end

  def kill_player(player)
    @enemies_in_sight.delete_at(player)
  end

  def is_still_ongoing?
    return @human_player.life_points > 0 || @players_left > 0

  def show_players
    puts @human_player.show_state
    puts "Il reste #{@enemies_in_sight.length} ennemis à affronter"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "Chercher une meilleure arme : tape 'a'"
    puts "Chercher à se soigner : tape 's'"
    puts "Attaquer un joueur en vue :"
    if enemies_in_sight.length >= 1 
      puts "#{@enemies_in_sight[0].show_state} : tape '0' pour l'attaquer"
    end
    if enemies_in_sight.length >= 2 
      puts "#{@enemies_in_sight[1].show_state} : tape '1' pour l'attaquer"
    end
    if enemies_in_sight.length >= 3 
      puts "#{@enemies_in_sight[2].show_state} : tape '2' pour l'attaquer"
    end
    if enemies_in_sight.length >= 4 
      puts "#{@enemies_in_sight[3].show_state} : tape '3' pour l'attaquer"
    end  
  end

  def menu_choice(choice)
    if choice == "a" 
      @human_player.search_weapon

    elsif choice == "s"
      @human_player.search_health_pack

    elsif choice == "0"
      @human_player.attacks(@enemies_in_sight[0])
      if @enemies_in_sight[0].life_points < 1
        kill_player(0)
      end

    elsif choice == "1"
      @human_player.attacks(@enemies_in_sight[1])
        if @enemies_in_sight[1].life_points < 1
        kill_player(1)
        end

    elsif choice == "2"
      @human_player.attacks(@enemies_in_sight[2])
        if @enemies_in_sight[2].life_points < 1
        kill_player(2)
        end

    elsif choice == "3"
      @human_player.attacks(@enemies_in_sight[3])
        if @enemies_in_sight[3].life_points < 1
        kill_player(3)
        end

    else 
      puts "Il faut choisir entre : a, s, 0, 1, 2, 3"
    end

  end

  def enemies_attack
    enemies_in_sight.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(human_player)
      end
    end
  end

  def end
    puts "============================="
    puts "|| La partie est terminée. ||"
    if human_player.life_points > 0
    puts "||    GG ! Tu as gagné !   ||"
    else
    puts "||  Loser, tu es mort !    ||"
    end
    puts "============================="
  end 

end 
end