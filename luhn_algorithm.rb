# Lunh Algorithm

# input
# - an integer
#
# output
# - true / false for valid Luhn formula
# - checksum integer
# - original integer with checksum integer added to the end


class Luhn

  attr_reader :luhn_num

  def initialize(num)
    @luhn_num = create(num)
  end

  def self.create(num)
    new_number = num.to_s
    (0..9).each do |n|
      tested_num = new_number + n.to_s
      return tested_num.to_i if Luhn.new(tested_num.to_i).valid?
    end
  end

  def create(num)
    luhn = [] 

    num.to_s.chars.reverse_each.with_index do |number, index|
      if index.even?
        luhn << number.to_i
      else
        if number.to_i * 2 <= 9 
          luhn << number.to_i * 2
        else
          luhn << (number.to_i * 2) - 9
        end
      end
    end

    luhn = luhn.reverse.map(&:to_s).join.to_i
  end

  def checksum
    luhn_num.to_s.chars.map(&:to_i).inject(&:+)
  end

  def valid?
    self.checksum % 10 == 0
  end

  def addends
    luhn_num.to_s.chars.map(&:to_i)
  end

end

luhn = Luhn.new(12_121)
p luhn
p luhn.valid?
p luhn.addends

luhn = Luhn.new(8631)
p luhn
p luhn.valid?
p luhn.addends

luhn = Luhn.new(4913)
p luhn.checksum

luhn = Luhn.new(201_773)
p luhn.checksum

luhn = Luhn.new(738)
p luhn 
p luhn.valid?

luhn = Luhn.new(8_739_567)
p luhn 
p luhn.valid?

number = Luhn.create(123)
p number

number = Luhn.create(873_956)
p number

number = Luhn.create(837_263_756)
p number

