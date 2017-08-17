# Series

# Write a program that will take a string of digits and give you all the possible 
# consecutive number series of length n in that string.

# input: a Series object that contains a string of integers as a state, and a number
# that indicates what length of slice to make out of the string

# output: an array of arrays, the subarrays representing slices of elements equal to the 
# number indicated in the input

# algorithm: 
# Create a "holding" array object to take the slices we create
# Set a start_slice =  0
# While N - start_slice >= 0:
# For the input N, create a slice of the integers string that contains N
# characters, starting with the character at index = start_slice (starting at 0) 
# and slicing off N characters. 
# For the resulting slice, split it into an array of separate chars, and then
# map this array into an array of integers. 
# Finally, push the resulting array of integers into the "holding" array that
# will return all the slices.
# Increment the start_slice counter by 1
# 
# After the while loop is exited, return the array of subarrays. 

class Series
  def initialize(num_string)
    @num_string = num_string
  end

  def slices(slice_size)
    raise(ArgumentError) if slice_size > @num_string.size || slice_size <= 0 # Guard clause

    output = []
    index = 0
    max_index = @num_string.size - 1

    while (index + (slice_size - 1)) <= max_index
      slice = @num_string[index, slice_size].chars.map(&:to_i)
      output << slice
      index += 1
    end

    output
  end

end

series = Series.new('01234')
p series.slices(1)

series = Series.new('01234')
p series.slices(3)

series = Series.new('01234')
p series.slices(4)