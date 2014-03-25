module ITOEN
  module_function
  
  def itoen(num)
    %w(zero one two three four five six seven eight nine ten
      eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty)[num]
  end
end