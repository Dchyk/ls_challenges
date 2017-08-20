# Anagrams

class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    possible_anagrams.select do |tested_word|
      tested_word.downcase != @word.downcase && @word.downcase.chars.sort == tested_word.downcase.chars.sort
    end
  end

end