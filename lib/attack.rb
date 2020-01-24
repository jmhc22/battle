class Attack

  def use_move(move, attacker, defender)
    p '-------------------use move reached--------------'

    method(move).call(attacker, defender)
  end

  private

  def normal(attacker, defender)
    defender.receive_damage(15)
    return "#{attacker.name} used Normal Attack. #{defender.name} took 15 HP damage."
  end

  def lucky(attacker, defender)
    damage = [5, 5, 10, 10, 15, 15, 20, 20, 30, 40].sample
    defender.receive_damage(damage)
    return "#{attacker.name} used Lucky Attack. #{defender.name} took #{damage} HP damage."
  end

  def poison(attacker, defender)
    defender.receive_damage(5)
    defender.status.poisoned unless defender.status.poisoned?
    return "#{attacker.name} used Poison Attack. #{defender.name} took 5 HP damage."
  end

  def lightning(attacker, defender)
    defender.receive_damage(10)
    defender.status.paralysed unless defender.status.paralysed?
    return "#{attacker.name} used Lightning Attack. #{defender.name} took 10 HP damage."
  end

  def psychic(attacker, defender)
    defender.receive_damage(5)
    defender.status.sleeps unless defender.status.asleep?
    return "#{attacker.name} used Psychic Attack. #{defender.name} took 5 HP damage."
  end

  def heal(attacker, _defender)
    heal_amount = [-5, -10, -20, -20, -30, -35].sample
    attacker.receive_damage(heal_amount)
    return "#{attacker.name} used Recover. #{attacker.name} recovered #{heal_amount.abs} HP."
  end
end
