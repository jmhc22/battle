class Status

  def initialize
    @poison = 0
    @asleep = 0
    @paralyse = 0
  end

  def status_recover
    @poison -= 1
    @asleep -= 1
    @paralyse -= 1
  end

  def asleep?
    @asleep > 0
  end

  def paralysed?
    @paralyse > 0
  end

  def poisoned?
    @poison > 0
  end

  def sleeps
    @asleep = [2, 2, 3, 3, 4].sample
  end

  def poisoned
    @poison = rand(3..5)
  end

  def paralysed
    @paralyse = rand(3..4)
  end

end
