require 'docking_station'
require 'bike'

describe DockingStation do


  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end


    it 'Only releases working bikes' do
      bike = double(:bike)
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error(RuntimeError)
    end

  end

  it 'releases working bikes' do
    new_bike = double(:bike)
    expect(new_bike).to be_working
  end


  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#dock' do
    it "docks the bike" do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when full' do
      subject.capacity.times {subject.dock double(:bike)}
      expect {subject.dock double(:bike)}.to raise_error 'Docking station full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

    describe 'initialization' do
      subject {DockingStation.new}
      let(:bike) {double(:bike)}
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect {subject.dock(bike)}.to raise_error 'Docking station full'
    end
  end
end
