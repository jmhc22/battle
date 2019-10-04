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
    return "recover" if @hit_points <= 35 && rand(3) !=2
    return early_game if player.hit_points >= 100
    return mid_game if player.hit_points >= 50
    end_game
  end

  private

  def early_game
    ["poison-sting", "poison-sting", "lucky-strike", "lucky-strike",
     "thunder-wave", "thunder-wave", "tackle", "hypnosis" ].sample
  end

  def mid_game
    ["hypnosis", "hypnosis", "lucky-strike", "lucky-strike", "tackle",
     "tackle", "thunder-wave", "recover"].sample
  end

  def end_game
    ["tackle", "tackle", "lucky-strike", "hypnosis", "recover",
     "recover", "poison-sting"].sample
  end

end
