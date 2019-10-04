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

  def thunder_wave(player)
    player.receive_damage(10)
    player.status.paralysed unless player.status.paralysed?
  end

  def hypnosis(player)
    player.receive_damage(5)
    player.status.sleeps unless player.status.asleep?
  end

  def recover(player)
    player.receive_damage([-5, -10, -20, -30, -35].sample)
  end

  private

  def lucky_caclulator
    [5, 5, 10, 10, 10, 15, 20, 20, 30, 40].sample
  end
end
