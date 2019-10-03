class Computer
  attr_reader :name, :hit_points, :last_damamge

  def initialize(attack_class: Attack)
    @name = "Computer"
    @hit_points = 100
    @attack_class = attack_class
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
    @attack_class.new.lucky_strike(player)
    "lucky strike"
  end

  def tackle(player)
    @attack_class.new.tackle(player)
    "tackle"
  end

end
