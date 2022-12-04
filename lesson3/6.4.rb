def is_an_ip_number?(string_number)
  if string_number.to_i.to_s == string_number
    (string_number.to_i > 0 && string_number.to_i < 255)
  else
    false
  end
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break false unless is_an_ip_number?(word)
  end
  return true
end

puts dot_separated_ip_address?('hi there. hello')
puts dot_separated_ip_address?("hi there")
puts dot_separated_ip_address?("4.5.5")
puts dot_separated_ip_address?("1.2.3.4.5")
puts dot_separated_ip_address?("10.4.5.11")
puts is_an_ip_number?("10")


