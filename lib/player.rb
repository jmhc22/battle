class Player
  attr_reader :name, :hit_points, :last_damamge
  DEFAULT_HIT_POINTS = 100

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage(amount)
    @hit_points -= amount
    @last_damamge = amount
  end
end
