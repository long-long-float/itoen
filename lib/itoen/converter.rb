module ITOEN
  module_function
  
  TABLE_0_9 = %w(zero one two three four five six seven eight nine)
  TABLE_11_19 = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  TABLE_PER_10 = %w(_ ten twenty thirty forty fifty sixty seventy eighty ninety)

  def itoen(num)
    case num
    when 0..9
      TABLE_0_9[num]
    when 11..19
      TABLE_11_19[num - 11]
    else
      TABLE_PER_10[num / 10] + (num % 10 != 0 ? ' ' + TABLE_0_9[num % 10] : '')
    end
  end
end