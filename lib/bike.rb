class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @broken = true
    @working = false
  end

  def broken?
    @broken
  end
end
