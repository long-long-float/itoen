require 'spec_helper'

describe ITOEN do
  it 'should have a version number' do
    ITOEN::VERSION.should_not be_nil
  end

  it 'returns numbers which less than 10' do
    [*0..10].map{|num|
      ITOEN.itoen(num)
    }.should eq %w(zero one two three four five six seven eight nine ten)
  end
end
