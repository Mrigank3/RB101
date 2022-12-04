def multiply(numbers_array,number)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers_array.size

    current_number = numbers_array[counter]
    multiplied_numbers << current_number * number

    counter += 1
  end

  multiplied_numbers
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]