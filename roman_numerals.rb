# 1, 2, 3 = 3 of the current symbol
# 4 = one of the current symbol, and one of the 5x symbol
# 5 = one of the 5x symbol
# 6, 7, 8 = one of the 5x symbol, and num - 5 of the 1 symbol
# 9 = one of the 1 symbol and one of the next order of magnitude 1 symbol

class Integer
  ROMAN_INDEX = {
  0 => {1 => "I", 5 => "V", 9 => "IX"},
  1 => {1 => "X", 5 => "L", 9 => "XC"},
  2 => {1 => "C", 5 => "D", 9 => "CM"},
  3 => {1 => "M"}
}

  def to_roman
    digits = self.to_s.chars.map(&:to_i)
    roman = []

    digits.reverse.each_with_index do |digit, index|
      if digit == 9
        roman << ROMAN_INDEX[index][9]
      elsif digit >= 5
        roman << ROMAN_INDEX[index][5] + ROMAN_INDEX[index][1]*(digit - 5)
      elsif digit == 4
        roman << ROMAN_INDEX[index][1] + ROMAN_INDEX[index][5]
      elsif digit <= 3 
        roman << ROMAN_INDEX[index][1]*digit
      end
    end

    roman.reverse.join
  end
end
