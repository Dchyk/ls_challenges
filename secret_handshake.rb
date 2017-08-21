# Secret handshake

# input
# - a decimal integer
#
# output
# - an array of strings
#
# algorithm
# - take the integer and convert to a binary number
# - take the binary number and split it into 1, 10, 100 and 1000.
# - Take the resulting binary number and divide it by 1000, 100, 10 and 1 respectively.
# - The number of results for each is the number of handshake elements matching that
#   number. 
# - If 10000 occurs, reverse the entire order of the array.

class SecretHandshake
  attr_reader :commands

  def initialize(num)
    @binary = convert_to_binary(num)
    @commands = []
    create_handshake
  end

  private

  def create_handshake
    reversed = false
    sequence = @binary

    loop do 
      case
      when sequence >= 10000
        reversed = true
        sequence -= 10000
      when sequence >= 1000
        @commands << 'jump'
        sequence -= 1000
      when sequence >= 100
        @commands << 'close your eyes'
        sequence -= 100
      when sequence >= 10 
        @commands << 'double blink'
        sequence -= 10
      when sequence >= 1
        @commands << 'wink'
        sequence -= 1
      end

      break if sequence < 1
    end

    @commands.reverse! unless reversed
  end

  def convert_to_binary(num)
    # If num isn't an integer, test to see if it can be converted to one.
    # If it can't (ie, it's text or other data) convert it to 0
    if !num.is_a?(Integer)
      if num.match(/[^01]/)
        num = 0 
      else
        return num.to_i  # If it's a valid binary, simply return it
      end
    end

    # Assuming the input wasn't already a binary, we process the input integer:

    binary = ''

    while num >= 1
      half, remainder = num.divmod(2)
      binary << remainder.to_s
      num = half
    end

    binary.reverse.to_i
  end

end
