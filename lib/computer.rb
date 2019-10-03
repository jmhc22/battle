require_relative 'battle_mechanics'

class Computer
  attr_reader :name, :hit_points, :last_damamge, :status
  include BattleMechanics

  def initialize(status: Status)
    @name = "Computer"
    @hit_points = 100
    @status = status.new
  end

  def move(player)
    return "lucky strike" if chance(player) == 1
    "tackle"
  end

  private

  def chance(player)
    chance = player.hit_points > 40 ? rand(1..2) : rand(1..3)
  end

end
