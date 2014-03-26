require "itoen/converter"

class Numeric
  def to_en
    ITOEN.itoen(self)
  end
end