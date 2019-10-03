module BattleMechanics
  def receive_damage(amount)
    @hit_points -= amount
    @last_damamge = amount
  end

  def poison_damage
    receive_damage(poison_calculator)
  end

  private

  def poison_calculator
    [5, 5, 5, 10].sample
  end

end
