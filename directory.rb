# First, we put all students into the array 'students'

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Check to see if the student name starts with an 'A'.
    if name.downcase.match /^a/
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
    # If not, we do not print the student name.
    else
      puts "That student does not exist"
    end
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

students = input_students

def print_header
  puts "The students of Villains Academy"
  puts "--------------------"
end

def print(students)
  students.each_with_index do |student, i|
    puts "#{i+1}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Then we call the functions.
print_header
print(students)
print_footer(students)
