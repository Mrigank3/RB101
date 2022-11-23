#a method that determines the index of the 3rd occurrence of a given character in 
#a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', 
#the method should return 6 (the index of the 3rd 'x'). If the given character does 
#not occur at least 3 times, return nil.
string = 'axbxcdeiop'

def index3(string)
  n = string.length
  i = 0
  count = 0
  
  while i <= n-1
    if string[i] == 'x'
      count += 1
      if count == 3
        puts i
        return i
      end
    end
   
    if i == n-1 && count <3
      puts nil
      return nil
    end
    i = i+1
  end
      
  
end

index3(string)

