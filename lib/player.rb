require_relative 'battle_mechanics'

class Player
  attr_reader :name, :hit_points, :last_damamge, :status
  include BattleMechanics

  def initialize(name, status = Status, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
    @status = status.new
  end
end
