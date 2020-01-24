require_relative 'battle_mechanics'

class Player
  attr_reader :name, :hit_points, :last_damage, :status, :code
  include BattleMechanics

  def initialize(name, code, status=Status, hit_points=DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
    @status = status.new
    @code = code
  end
end
