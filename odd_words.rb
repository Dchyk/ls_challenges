# input
# - a string consisting of letters, spaces, and points.
#
# output
# - a string

# algorithm
# - scan the input string and take everything from the first character
#   up to the terminating point as the input string for processing
# - squeeze string to remove extra spaces
# - split string into an array of words 
# - map the string with indexes, and call #reverse on each element with 
#   an odd index 
# - join the array of strings with a space as the delimiter
# - print the string

input = "whats the matter with kansas." #=> "whats eht matter htiw kansas."

class OddWords
  def self.reverse_odds(str)
    input = str.split(".").first
    words = input.split(" ")

    odd_reversed = words.map.with_index do |word, index|
      if index.odd?
        word.reverse
      else
        word
      end
    end

    odd_reversed.join(" ") << "."
  end
end