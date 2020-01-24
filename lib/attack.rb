class Attack

  def use_move(move, attacker, defender)
    p '-------------------use move reached--------------'

    method(move).call(attacker, defender)
  end

  private

  def normal(attacker, defender)
    defender.receive_damage(15)
    p 'normal'
  end

  def lucky(attacker, defender)
    defender.receive_damage([5, 5, 10, 10, 15, 15, 20, 20, 30, 40].sample)
    p 'lucky'
  end

  def poison(attacker, defender)
    defender.receive_damage(5)
    defender.status.poisoned unless defender.status.poisoned?
  end

  def lightning(attacker, defender)
    defender.receive_damage(10)
    defender.status.paralysed unless defender.status.paralysed?
  end

  def psychic(attacker, defender)
    defender.receive_damage(5)
    defender.status.sleeps unless defender.status.asleep?
  end

  def heal(attacker, _defender)
    attacker.receive_damage([-5, -10, -20, -20, -30, -35].sample)
  end
end
