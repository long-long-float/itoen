require 'spec_helper'

describe ITOEN do
  it 'should have a version number' do
    ITOEN::VERSION.should_not be_nil
  end

  it 'returns English numbers (0..10)' do
    [*0..10].map{|num|
      ITOEN.itoen(num)
    }.should eq %w(zero one two three four five six seven eight nine ten)
  end

  it 'returns English numbers (11..20)' do
    [*11..20].map{|num|
      ITOEN.itoen(num)
    }.should eq %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty)
  end

  it 'returns English numbers (20, 30, 40, 50, 60, 70, 80, 90)' do
    20.step(90, 10).map{|num|
      ITOEN.itoen(num)
    }.should eq %w(twenty thirty forty fifty sixty seventy eighty ninety)
  end

  it { 21.to_en.should eq 'twenty-one' }
  it { 99.to_en.should eq 'ninety-nine' }
  it { 100.to_en.should eq 'one hundred' }
  it { 777.to_en.should eq 'seven hundred seventy-seven'}
end
