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
      nums = num.to_s.each_char.map(&:to_i).reverse
      [
        (nums[2] && "#{TABLE_0_9[nums[2]]} hundred "),
        (nums[1] != 0 ? TABLE_PER_10[nums[1]] : ''),
        (nums[0] != 0 ? '-' : ''),
        (nums[0] != 0 ? TABLE_0_9[nums[0]] : '')
       ].join.strip
    end
  end

  private

  def num_by_digit(num, digit)
    num.to_s[digit]
  end
end