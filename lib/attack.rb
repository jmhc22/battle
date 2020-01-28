class Attack

  def use_move(move, attacker, defender)
    method(move).call(attacker, defender, move)
  end

  private

  def normal(attacker, defender, move)
    defender.receive_damage(15)
    return ["#{attacker.name} used Normal Attack. #{defender.name} took 15 HP damage.", move]
  end

  def lucky(attacker, defender, move)
    damage = [15, 15, 5, 5, 10, 10, 20, 20, 30, 40].sample
    defender.receive_damage(damage)
    return ["#{attacker.name} used Lucky Attack. #{defender.name} took #{damage} HP damage.", move]
  end

  def poison(attacker, defender, move)
    defender.receive_damage(5)
    defender.status.poisoned unless defender.status.poisoned?
    return ["#{attacker.name} used Poison Attack. #{defender.name} took 5 HP damage.", move]
  end

  def lightning(attacker, defender, move)
    return ["#{attacker.name} used Lightning Attack, but it missed!", false] if rand(1..10) > 8
    defender.receive_damage(10)
    defender.status.paralysed unless defender.status.paralysed?
    return ["#{attacker.name} used Lightning Attack. #{defender.name} took 10 HP damage.", move]
  end

  def psychic(attacker, defender, move)
    return ["#{attacker.name} used Psychic Attack, but it missed!", false] if rand(1..10) > 5
    defender.receive_damage(5)
    defender.status.sleeps unless defender.status.asleep?
    return ["#{attacker.name} used Psychic Attack. #{defender.name} took 5 HP damage.", move]
  end

  def heal(attacker, _defender, move)
    return ["#{attacker.name}'s HP is already too full!", false] if attacker.hit_points >= 100
    heal_amount = [-5, -10, -20, -20, -30, -35].sample
    attacker.receive_damage(heal_amount)
    return ["#{attacker.name} used Recover. #{attacker.name} recovered #{heal_amount.abs} HP.", move]
  end
end
