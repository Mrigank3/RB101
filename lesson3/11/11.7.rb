#Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock" 
#=>{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
hash = {}
split_array = statement.split('')
split_array.delete(" ")
p split_array
split_array.each_with_object(hash) do |arr_element,hash|
 hash[arr_element] = split_array.count(arr_element) 
 #In hashes keys are unique, so every new incident of the same key overwrites the previous one, 
 #because the value remains the same, we dont run into issues here.
end

p hash
