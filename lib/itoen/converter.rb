module ITOEN
  module_function
  
  TABLE_0_9 = %w(zero one two three four five six seven eight nine)
  TABLE_11_19 = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  TABLE_PER_10 = %w(_ ten twenty thirty forty fifty sixty seventy eighty ninety)
  TABLE_POW_1000 = %w(_ thousand million billion trillion quadrillion quintillion sextillion 
    septillion octillion nonillion decillion undecillion duodecillion tredecillion quattuordecillion
    quindecillion sexdecillion septendecillion octodecillion novemdecillion vigintillion unvigintillion
    duovigintillion trevigintillion quattuorvigintillion quinvigintillion sexvigintillion septenvigintillion
    octovigintillion novemvigintillion trigintillion untrigintillion duotrigintillion tretrigintillion quattuortrigintillion
    quintrigintillion sextrigintillion septentrigintillion octotrigintillion novemtrigintillion quadragintillion
    unquadragintillion duoquadragintillion trequadragintillion quattuorquadragintillion quinquadragintillion sexquadragintillion
    septenquadragintillion octoquadragintillion novemquadragintillion quinquagintillion unquinquagintillion duoquinquagintillion
    trequinquagintillion quattuorquinquagintillion quinquinquagintillion sexquinquagintillion septenquinquagintillion octoquinquagintillion
    novemquinquagintillion sexagintillion unsexagintillion duosexagintillion tresexagintillion quattuorsexagintillion quinsexagintillion
    sexsexagintillion septsexagintillion octosexagintillion novemsexagintillion septuagintillion unseptuagintillion duoseptuagintillion
    treseptuagintillion quattuorseptuagintillion quinseptuagintillion sexseptuagintillion septseptuagintillion octoseptuagintillion
    novemseptuagintillion octogintillion unoctogintillion duooctogintillion treoctogintillion quattuoroctogintillion quinoctogintillion
    sexoctogintillion septoctogintillion octooctogintillion novemoctogintillion nonagintillion unnonagintillion duononagintillion
    trenonagintillion quattuornonagintillion quinnonagintillion sexnonagintillion septnonagintillion octononagintillion novemnonagintillion centillion)

  def itoen(num)
    if num < 0
      return "negative #{itoen(-num)}"
    end

    int, decimal = num.to_s.split('.').map{|_| _.each_char.map(&:to_i) }
    int = int.reverse

    ret = []
    ret.concat(case num
    when 0..9
      [TABLE_0_9[num]]
    when 11..19
      [TABLE_11_19[num - 11]]
    when ->(n){ n < 100 }
      [
        [
          (int[1] != 0 ? TABLE_PER_10[int[1]] : ''),
          (int[0] != 0 ? '-' : ''),
          (int[0] != 0 ? TABLE_0_9[int[0]] : '')
          ].join
        ]
    when ->(n){ n < 1000 }
      under100 = int[0..1].reverse.join.to_i
      [
        (int[2] != 0 ? "#{TABLE_0_9[int[2]]} hundred" : ''), 
        (under100 != 0 ? itoen(under100) : '')
      ]
    else
      int.each_slice(3).map.with_index do |nums, digit|
        num = nums.reverse.join.to_i
        next nil if num == 0
        begin
          "#{itoen(num)} #{digit != 0 ? TABLE_POW_1000.fetch(digit) : ''}"
        rescue IndexError
          raise TooBigError
        end
      end.reverse.select{|n| n}
    end)

    if decimal
      ret << 'point'
      ret.concat decimal.map{|d| itoen(d) }
    end

    ret.join(' ').strip
  end
end