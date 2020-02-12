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
        new_arr.push(new_thing)
    }
    return filtered_array
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

filtered_data = filter_data(arr)

p filtered_data