# Word count

# input
# - a string
#
# output
# - a count of how many times each word appears in the string
#
#

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    count = Hash.new(0)

    @phrase.scan(/\b[\w']+\b/) do |word|  # Refactored
      count[word.downcase] += 1
    end

    count
  end
end