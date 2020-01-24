class Game
  attr_reader :player_1, :player_2

  def self.instance
    @game
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1: player_1, player_2: player_2)
  end

  def initialize(player_1: player_1, player_2: player_2, attack: Attack)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
    @attack = attack.new
  end

  def play_turn(move)
    p '-------------------reached play turn--------------'
    @attack.use_move(move, current_turn, defending_player)
    p current_turn
    p defending_player
    switch_turns
  end

  def current_turn
    @players.first
  end

  def defending_player
    @players.last
  end

  def switch_turns
    @players.reverse!
  end
end
