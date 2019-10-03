class Attack

  def tackle(player)
    player.receive_damage(15)
  end

  def lucky_strike(player)
    player.receive_damage(lucky_caclulator)
  end

  def poison_sting(player)
    player.receive_damage(5)
    player.status.poisoned unless player.status.poisoned?
  end

  private

  def lucky_caclulator
    [5, 5, 10, 10, 10, 15, 20, 20, 30, 40].sample
  end
end
