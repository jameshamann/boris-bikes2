require_relative 'bike'

class DockingStation

  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'This bike is broken' if bikes[-1].broken?
    bikes.pop
  end

attr_reader :bikes
private


  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end


end
