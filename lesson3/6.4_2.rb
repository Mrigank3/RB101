def is_an_ip_number?(string_number)
  if string_number.to_i.to_s == string_number
    (string_number.to_i > 0 && string_number.to_i < 255)
  else
    false
  end
end

def invalid_length(array)
  array.size != 4
end
  
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  word = ''
  
  if invalid_length(dot_separated_words)
   return false
  else 
    while dot_separated_words.size > 0
      word = dot_separated_words.pop
      unless is_an_ip_number?(word)
        return false
      end
    end
  end
  return true
end

puts dot_separated_ip_address?('hi there. hello')
puts dot_separated_ip_address?("hi there")
puts dot_separated_ip_address?("4.5.5")
puts dot_separated_ip_address?("1.2.3.4.5")
puts dot_separated_ip_address?("10.4.5.11")
