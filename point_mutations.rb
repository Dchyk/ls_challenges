# Point mutations

# Compare two strings and count the differences between them
# If the strings are different lenghts, count up to the end of the
# smaller string.


class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    if @strand.size > other_strand.size
      first = @strand.slice(0..(other_strand.size - 1))
      second = other_strand
    elsif other_strand.size > @strand.size
      first = other_strand.slice(0..(@strand.size - 1))
      second = @strand
    else
      first = @strand
      second = other_strand
    end

    distance = 0 

    first.chars.each_with_index do |char, index|
      distance += 1 if char != second[index]
    end

    distance
  end
end