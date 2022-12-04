#Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = flintstones.find_index { |n| n[0,2] == 'Be' }

puts index



