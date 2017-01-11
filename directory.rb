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
    # Check to see if the student name is longer than 12 characters. We're only printing shorter names.
    if name.length < 12
      students << {name: name, cohort: :november, height: rand(1.5..2.0).round(2)}
      puts "Now we have #{students.count} students"
    # If it is longer, we do not print the student name.
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
  countries = ["United Kingdom", "Ireland", "France", "Germany", "USA", "Spain", "Kenya", "Russia", "Japan"]
  hobbies = ["murdering", "stealing candy from babies", "world domination", "armed robbery", "being evil", "shooting guns"]
  num = 0
  until num == students.length do
    x = students[num]
    puts "#{num+1}: #{x[:name]}, #{x[:height]}m tall, #{countries.sample}. Favourite hobbies: #{hobbies.sample}. (#{x[:cohort]} cohort)"
    num += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Then we call the functions.
print_header
print(students)
print_footer(students)
