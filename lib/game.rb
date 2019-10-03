class Game
  attr_reader :current_turn, :player_1, :player_2

  def initialize(player_1: player_1, player_2: player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1: player_1, player_2: player_2)
  end

  def self.instance
    @game
  end

  def current_turn
    @players.first
  end

  def defending_player
    @players.last
  end

  def switch_turns
    @players.reverse!
    @current_turn = @players.first
  end

end
