require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    @enemies << player1 = Player.new("Josiane")
    @enemies << player2 = Player.new("José")
    @enemies << player3 = Player.new("Janine")
    @enemies << player4 = Player.new("Jean")
  end

  def kill_player(player)
    @enemies.delete_at(player)
  end

  def is_still_ongoing?
    return @human_player.life_points > 0 || @enemies.length > 0
  end

  def show_players
    puts @human_player.show_state
    puts "Il reste #{@enemies.length} ennemis à affronter"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "Chercher une meilleure arme : tape 'a'"
    puts "Chercher à se soigner : tape 's'"
    puts "Attaquer un joueur en vue :"
    if enemies.length >= 1 
      puts "#{@enemies[0].show_state} : tape '0' pour l'attaquer"
    end
    if enemies.length >= 2 
      puts "#{@enemies[1].show_state} : tape '1' pour l'attaquer"
    end
    if enemies.length >= 3 
      puts "#{@enemies[2].show_state} : tape '2' pour l'attaquer"
    end
    if enemies.length >= 4 
      puts "#{@enemies[3].show_state} : tape '3' pour l'attaquer"
    end  
  end

  def menu_choice(choice)
    if choice == "a" 
      @human_player.search_weapon

    elsif choice == "s"
      @human_player.search_health_pack

    elsif choice == "0"
      @human_player.attacks(@enemies[0])
      if @enemies[0].life_points < 1
        kill_player(0)
      end

    elsif choice == "1"
      @human_player.attacks(@enemies[1])
        if @enemies[1].life_points < 1
        kill_player(1)
        end

    elsif choice == "2"
      @human_player.attacks(@enemies[2])
        if @enemies[2].life_points < 1
        kill_player(2)
        end

    elsif choice == "3"
      @human_player.attacks(@enemies[3])
        if @enemies[3].life_points < 1
        kill_player(3)
        end

    else 
      puts "Il faut choisir entre : a, s, 0, 1, 2, 3"
    end

  end

  def enemies_attack
    enemies.each do |enemy|
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

