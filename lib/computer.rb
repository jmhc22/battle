require_relative 'battle_mechanics'

class Computer
  attr_reader :name, :hit_points, :last_damage, :status
  include BattleMechanics

  def initialize(status: Status)
    @name = "Computer"
    @hit_points = DEFAULT_HIT_POINTS
    @status = status.new
  end

  def move(player)
    return "heal" if @hit_points <= 40 && rand(2) !=1
    return early_game if player.hit_points >= 100
    return mid_game if player.hit_points >= 50
    end_game
  end

  private

  def early_game
    ["poison", "poison", "lucky", "lucky",
     "lightning", "lightning", "normal", "psychic" ].sample
  end

  def mid_game
    ["psychic", "psychic", "lucky", "lucky", "normal",
     "normal", "lightning", "heal"].sample
  end

  def end_game
    ["normal", "normal", "lucky", "psychic", "psychic",
     "heal", "poison"].sample
  end
end
