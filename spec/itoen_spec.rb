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
  it { 119.to_en.should eq 'one hundred nineteen' }
  it { 777.to_en.should eq 'seven hundred seventy-seven'}

  it { (10**3).to_en.should eq 'one thousand' }
  it { (10**4).to_en.should eq 'ten thousand' }
  it { (10**6).to_en.should eq 'one million' }
  it { (10**9).to_en.should eq 'one billion' }
  it { (10**12).to_en.should eq 'one trillion' }
  it { (10**15).to_en.should eq 'one quadrillion' }
  it { 1284592671.to_en.should eq 'one billion two hundred eighty-four million five hundred ninety-two thousand six hundred seventy-one' }

  it 'raises error' do
    ->{ (10**306).to_en }.should raise_error ITOEN::TooBigError
  end

  it 'returns negative number' do
    -7.to_en.should eq 'negative seven'
  end
end
