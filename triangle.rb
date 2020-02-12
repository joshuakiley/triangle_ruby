# ==============================
#           FUNCTIONS
# ==============================

# Read the file and return an array where each element is a line from the document
def stream_document file
    arr = Array.new
    IO.foreach("./resources/#{file}.txt") { |line| arr.push(line) }
    return arr
end

# Takes each element of the array and filters out the special characters
def filter_data arr
    filtered_array = Array.new
    arr.map { |element|
        new_thing = element.split(/[\s]/)
        filtered_array.push(new_thing)
    }
    return filtered_array
end

# convert strings to numbers for calculations
def convert_data outer_arr
    new_outer_array = Array.new
    
    outer_arr.map { |inner_arr|
        new_inner_array = Array.new
        inner_arr.map { |element|
            new_inner_array.push(element.to_i)
        }
        new_outer_array.push(new_inner_array)
    }
    return new_outer_array
end

# Calculates the maximum possible value for the triangle problem
def max_calc arr_nest
    while arr_nest.length > 1
        sums = Array.new
        last_line = arr_nest.pop()
        second_to_last_line = arr_nest.pop()

        second_to_last_line.each_with_index.map { |value, index| 
            check =  [value + last_line[index], value + last_line[index + 1]]
            sums.push(check.max)
        }
        arr_nest.push(sums)
    end
    return arr_nest[0][0]
end

# ==============================
#           VARIABLES
# ==============================

# I declare the variables and their type here for clarity
file_data = Array.new
filtered_data = Array.new

# ==============================
#           EXECUTION
# ==============================

puts "Please enter the file name excluding file extension:"

file_data = gets.chomp

if File.exist?("./resources/#{file_data}.txt")
    puts "#{file_data} exists..."
    arr = stream_document(file_data)
else 
    puts "Not found:"
    p "./resources/#{file_data}.txt"
end

# The data filtered of special characters
filtered_data = filter_data(arr)

# the data converted into integers
converted_data = convert_data(filtered_data)

# the max sum according the the rules of the triangle problem
max_sum = max_calc(converted_data)

puts "The largest possible sum when adding the top line of the triangle with an adjacent number below it, and following this method to the bottom of the triangle is: #{max_sum}"