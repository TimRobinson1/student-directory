@students = []
require 'CSV'

def student_input_loop(name)
  while !name.empty? do
    # Add the student hash to the array
    student_list(name)
    puts "Now we have #{@students.count} students"
    # Get another name from the user
    name = STDIN.gets.chomp
  end
  puts "Students added. We now have a total of #{@students.count} students"
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  # Get the first name
  name = STDIN.gets.chomp
  # While the name is not empty, repeat this code
  student_input_loop(name)
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
  puts "3. Save the list of students to a file"
  puts "4. Load list of students from a file"
  puts "5. Clear the current list of students"
  puts "9. Exit" # This is 9 because we'll be adding more items.
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
end

def process_input(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    clear_students
  when "9"
    puts "Exiting program..."
    exit # This terminates the program.
  else
    puts "I don't understand, please try again."
  end
end

def save_students
  puts "Please enter the file name you wish to save to"
  file = STDIN.gets.chomp
  if File.exists?(file) # Checks existence of filename
    CSV.open("students.csv", "wb") do |f|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data
        f.puts csv_line
      end
      puts "Students saved to file."
    end
  else # If it doesn't exist
    puts "Sorry, #{file} doesn't exist."
  end
end

def load_students(filename = "students.csv")
  puts "Please enter the file you wish to load"
  file = STDIN.gets.chomp
  load_students_loop(file)
end

def load_students_loop(file)
  if File.exists?(file)
    # Opens the file in read-only mode.
    @students = []
    CSV.foreach(file) do |line|
        name, cohort = line.join(',').chomp.split(',')
        student_list(name, cohort)
    end
    puts "Students loaded from file."
  else
    puts "The file #{file} does not exist."
  end
  # Must always remember to close files when they've been opened.
end

def initial_load_students
  filename = ARGV.first # Takes the first argument from the command line.
  if filename.nil?
    load_students_loop("students.csv")
    puts "Default student file: students.csv"
  else
    if File.exists?(filename) # Checks existence of filename
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else # If it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # Quits the program
    end
  end
end

def student_list(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def clear_students
  @students = []
  puts "All students expelled."
end

def interactive_menu
  loop do
    print_menu
    process_input(STDIN.gets.chomp)
  end
end

# Then we call the functions.
initial_load_students
interactive_menu
