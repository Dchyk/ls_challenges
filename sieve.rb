# Sieve of Erotosthenes

# input
# - an integer
#
# output 
# - a list of all primes between 2 and the input integer "input_value"
#
# algorithm
# - set search_range = current_value..input_value
# - set current_value = current_value..input_value.to_a.pop
# - iterate through the ranger of numbers from current_value up to 
#   input_value, advancing by current_value on each iteration. 
# - Push each current_value into a new collection called "marked" - these
#   are not prime. 
# - Break the loop when current_value + current_value > input_value
# - Find the minimum collection in the range 

require 'pry'

class Sieve
  FIRST_PRIME = 2

  def initialize(input_value)
    @input_value = input_value
  end

  def primes
    search_range_hash = {}
    current_value     = FIRST_PRIME
    lowest_unmarked   = current_value


    # Generate a hash object containing keys for each number in the range we're
    # testing, and values all set to 'unmarked' 
    FIRST_PRIME.upto(@input_value) do |num|
      search_range_hash[num] = 'unmarked'
    end


    loop do


      loop do
        break if current_value > @input_value
        current_value += lowest_unmarked
        search_range_hash[current_value] = 'marked'
      end

      lowest_unmarked = search_range_hash.select { |_, value| value == 'unmarked' }.keys.min
      break unless search_range_hash.any? { |key, value| key > lowest_unmarked && value == 'unmarked' }
      current_value = lowest_unmarked
      binding.pry
    end

    search_range_hash.select { |_, value| value == 'unmarked' }.keys

  end
end

p Sieve.new(10).primes