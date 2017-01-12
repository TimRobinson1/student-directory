@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Get the first name
  name = STDIN.gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get another name from the user
    name = STDIN.gets.chomp
  end
  # Return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load list of students from students.csv"
  puts "9. Exit" # This is 9 because we'll be adding more items.
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # This terminates the program.
  else
    puts "I don't understand, please try again."
  end
end

def save_students
  # Open file for writing
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved to file."
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Students loaded from file."
end

def try_load_students
  filename = ARGV.first # Takes the first argument from the command line.
  return if filename.nil? # Exits the method if it isn't given
  if File.exists?(filename) # Checks existence of filename
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If it doesn't exist
    puts "Sorrym #{filename} doesn't exist."
    exit # Quits the program
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# Then we call the functions.
try_load_students
interactive_menu
