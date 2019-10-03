class Computer
  attr_reader :name, :hit_points, :last_damamge

  def initialize
    @name = "Computer"
    @hit_points = 100
  end

  def receive_damage(amount)
    @hit_points -= amount
    @last_damamge = amount
  end

  def move(player)
    return lucky_strike(player) if chance(player) == 1
    tackle(player)
  end

  private

  def chance(player)
    chance = player.hit_points > 40 ? rand(1..2) : rand(1..3)
  end

  def lucky_strike(player)
    Attack.new.lucky_strike(player)
    "lucky strike"
  end

  def tackle(player)
    Attack.new.tackle(player)
    "tackle"
  end

end
