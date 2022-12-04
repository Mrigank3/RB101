#minimum age
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

value_array = ages.values
maximum_value = value_array.max

ages.select! do |k,v| 
  v == maximum_value
end

p ages