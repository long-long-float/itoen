require "itoen/converter"

class Integer
  def to_en
    ITOEN.itoen(self)
  end
end