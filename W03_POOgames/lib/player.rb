class Player
  attr_accessor :name, :life_points

  def initialize (name)
    @name = name
    @life_points = 10
  end

  def show_state
    print "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage (damages)
    @life_points -= damages
    if @life_points < 1
      puts "Le joueur #{name} a été tué !"
    end
  end

  def attacks (player_attacked)
    puts "Le joueur #{name} attaque le joueur #{player_attacked.name} !"
    damages = compute_damage
    puts "Il lui inflige #{damages} points de dommages."
    player_attacked.gets_damage(damages)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}."
    if new_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_value = rand(1..6)
    if health_value == 1
      puts "Tu n'as rien trouvé..."
    elsif health_value >= 2 && health_value <= 5
      puts "Bravo, tu gagnes 50 points de vie !"
      @life_points += 50 
      if @life_points > 100
        @life_points = 100
      end
    else 
      puts "Woaw, tu as trouvé un pack de 80 points de vie !"
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
    end
    puts "Tu as maintenant #{@life_points} points de vie."
  end

end