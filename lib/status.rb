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
    @asleep = [2, 2, 3 ,3, 3, 4].sample
  end

  def poisoned
    @poison = rand(3..6)
  end

  def paralysed
    @paralyse = [4, 4, 5].sample
  end

  def cannot_move?
    rand(2) == 1
  end

end
