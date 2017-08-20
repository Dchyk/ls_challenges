# Sum of multiples 

# input
# - an integer
# - a set of multiples (defaults to 3 and 5 if not given)
#
# output
# - an integer, representing the sum of all the multiples (of 3 or 5, or
# of the input numbers provided), up to the input number - 1 (one less)
#
# algorithm
# - save the multiples being tested as an array called multiples
# - iterate through the range of numbers 1 up to input - 1
# - if multiples.any? { |num| }



class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    if multiples.empty?
      @multiples = [3, 5]
    else
      @multiples = multiples
    end
  end

  def self.to(num)
    sum = 0
    multiples = [3, 5]

    (1..(num - 1)).each do |current_num|
      if multiples.any? { |multiple| current_num % multiple == 0 }
        sum += current_num
      end
    end

    sum
  end

  def to(num)
    sum = 0

    (1..(num - 1)).each do |current_num|
      if @multiples.any? { |multiple| current_num % multiple == 0 }
        sum += current_num
      end
    end

    sum
  end
end





sum = 0 

range.each do |current_num|
  if multiples.any? { |multiple| current_num % multiple == 0 }
    sum += current_num
  end
end