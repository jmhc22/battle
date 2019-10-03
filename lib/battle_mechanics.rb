module BattleMechanics
  def receive_damage(amount)
    @hit_points -= amount
    @last_damamge = amount
  end

  def poison_damage
    @hit_points -= poison_calculator
  end

  private

  def poison_calculator
    [5, 5, 5, 10, 15].sample
  end

end
