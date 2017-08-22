# Pig Latin

# input 
# - a string
#
# output 
# - a string
#
# algorithm
# - split the string into words if necessary
# - iterate through the resulting array and transform each element according to the rules
# 
# Rules
# - If the word starts with 'aeiou' then add 'ay' to the end
# - If the word starts with 'bcdfghjklmnprstvwz', then find the first time one of 'aeiou' 
#   appears in the string, and delete all characters to the left of that, then prepend them
#   to the end of the string + 'ay'
#   If the word starts with 'qu', then find the first time another vowel appears and delete the
#   'qu', then prepend 'qu' + 'ay' to the end of the string 
# - If the word starts with 'y' or 'x', then if the next character is NOT a vowel, just prepend
#   'ay' to the end of the string. If the next character IS a vowel, then delete 'x' or 'y' and move
#   them to the end of the string, and prepend 'ay'

class PigLatin
  VOWELS = 'aeiou'
  CONSONANTS = 'bcdfghjklmnpqrstvwz'
  X_OR_Y = 'xy'


  def self.translate(string)
    @words = string.split

    pig_latin = @words.map do |word|
      if VOWELS.include?(word[0])
        word + 'ay'
      elsif CONSONANTS.include?(word[0])
        first_vowel_position = nil
        if word[0] == 'q'
          first_vowel_position = word.index(/[aeio]/) # Account for 'qu' cases
        else
          first_vowel_position = word.index(/[aeiou]/)
          if word[first_vowel_position - 1] == 'q'
            first_vowel_position = word[(first_vowel_position + 1)..-1].index(/[aeio]/) + word[0..first_vowel_position].size
          end
        end
        word[first_vowel_position..-1] + word[0..(first_vowel_position - 1)] + 'ay'
      elsif X_OR_Y.include?(word[0])
        if CONSONANTS.include?(word[1])
          word + 'ay'
        else
          word[1..-1] + word[0] + 'ay'
        end
      end
    end

    pig_latin.join(' ')

  end
end
