class Game
  attr_reader :current_turn, :player_1, :player_2

  def initialize(player_1: Player.new(name), player_2: Player.new(name))
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def defending_player
    @players.last
  end

  def switch_turns
    @players.reverse!
    @current_turn = @players.first
  end

end
