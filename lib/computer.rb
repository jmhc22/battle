class Computer
  attr_reader :name, :hit_points

  def initialize
    @name = "Computer"
    @hit_points = 100
  end

  def move(player)
    if rand(1..3) == 1
      Attack.new.lucky_strike(player)
    else
      Attack.new.tackle(player)
    end
  end
end
