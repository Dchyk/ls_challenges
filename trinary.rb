# Convert a trinary number (represented as a string) to its
# decimal equivalent using first principles. 

# input
# - a string, with chars 0, 1, or 2
#
# output
# - an integer 
#
# algorithm
# - validate the input string 
# - reverse the string, and split it into an array, then iterate
#   through each element
# - Sum the result of multiplying each element by 3**index
# - Return the resulting sum 


class Trinary 
  def initialize(trinary_str)
    @trinary = trinary_str
  end

  def trinary
    if @trinary.match(/[4-9A-Za-z]/)
      '0'
    else
      @trinary
    end
  end

  def to_decimal
    trinary.reverse.chars.map.with_index do |num, index|
      num.to_i * 3**index
    end.inject(&:+)
  end


end