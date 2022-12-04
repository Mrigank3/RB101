flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

 new_hash = flintstones.each_with_object({}) do |value,hash|
            hash[value] = flintstones.find_index(value)
            end

puts new_hash

