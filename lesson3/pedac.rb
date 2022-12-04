def sum_even_number_row(row_number)
 rows = []
 start_integer = 2
 (1..row_number).each do |current_row_number|
   rows << create_row(start_integer,current_row_number)
   start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer,row_length)
  row = []
  loop do 
    row << start_integer
    start_integer += 2
    break if row.length == row_length
  end
  row
  
end


p sum_even_number_row(4)