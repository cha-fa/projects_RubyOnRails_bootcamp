# ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie.

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @round_played = 0
    @symbol = symbol
  end

end
