require "pry"


class Boardcase
  attr_accessor :position, :case_state

  def initialize(position)
    @position = position
    @case_state = " "
  end

end

