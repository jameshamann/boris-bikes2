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
    working_bikes = @bikes.select{|bike| bike.working?}
    fail 'This bike is broken' if working_bikes.empty?
    working_bikes.pop
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
