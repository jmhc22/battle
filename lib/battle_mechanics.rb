module BattleMechanics

  DEFAULT_HIT_POINTS = 150
  def receive_damage(amount)
    @hit_points -= amount
    @hit_points = 0 if @hit_points < 0
  end

  def poison_damage
    damage = [5, 5, 5, 10].sample
    receive_damage(damage)
    return "#{@name} is poisoned and took #{damage} HP damage"
  end
end
