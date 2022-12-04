def titleize(string)
  array_of_elements = string.split(' ')
  array_of_elements.each { |word| word.capitalize! }
  array_of_elements.join(' ')
end

words = "the flintstones rock"

p titleize(words)

#avoiding a method 

words = "the flintstones rock"

array = words.split(' ')
array.each { |word| word.capitalize!}

words = array.join(' ')

p words
