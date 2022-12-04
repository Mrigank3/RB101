=begin { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
  
=end

def age_group(num)
  if num >=0 && num <= 17
    'kid'
  elsif num >17 && num <=64
    'adult'
  else
    'senior'
  end
end


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

=begin
key_array = munsters.keys

value_array = munsters.values


value_array.each do |hash|
  hash['age_group'] = age_group(hash['age'])
end

hash = {}

value_array.each_with_index do |element,index|
  hash[key_array[index]] = element
end

p hash
=end

munsters.each do |key,value_hash|
  value_hash['age_group'] = age_group(value_hash['age'])
end

p munsters
