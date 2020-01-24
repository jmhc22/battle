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
    @turn_outcome = []
  end

  def play_turn(move)
    return status_check || [@attack.use_move(move, current_turn, defending_player), move]
  end

  def over?
    defending_player.hit_points <= 0
  end

  def poison_check
    return defending_player.poison_damage if defending_player.status.poisoned?
  end

  def switch_turns
    @players.reverse!
    return current_turn.is_a? Computer
  end

  def current_turn
    @players.first
  end

  def defending_player
    @players.last
  end

  private

  def status_check
    return ["#{current_turn.name} is asleep!", false] if current_turn.status.asleep?
    return ["#{current_turn.name} is paralysed and can't move!", false] if current_turn.status.paralysed? && current_turn.status.cannot_move?
    return nil
  end
end
