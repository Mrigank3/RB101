#What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
a = numbers.each do |number|
  p number
  numbers.shift(1)
end
p a
=begin
Shift mutates the caller. .shift(1) when called on the first element will return that 
element and will mutate the numbers array so it looks like [2,3,4] before the second
iteration begins. But here, the element on the index 0 is 2 and on index 1 is 3.
Keeping in my mind that the second iteration will put the paramaneter number = element on 
index 1. So, p number will evaluate to printing 3. and so on.
the output should be=>
1,3.
number.each here will return the original numbers, which is now mutated and is [3,4]
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#Same logic like the one above but the elemenets removed are from the end. output
#should be 1,2