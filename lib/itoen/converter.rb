module ITOEN
  module_function
  
  TABLE = %w(zero one two three four five six seven eight nine ten
    eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty)

  20.step(90, 10).each_with_index do |num, i|
    TABLE[num] = %w(twenty thirty forty fifty sixty seventy eighty ninety)[i]
  end 

  def itoen(num)
    TABLE[num]
  end
end