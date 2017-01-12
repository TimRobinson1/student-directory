
def input_students
  months = ["january", "february", "march", "april", "may", "june", "july", "august",
            "september", "october", "november", "december", "unknown"]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  while name.empty? do
    puts "Please input at least one name."
    name = gets.chomp
  end
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Check to see if the student name is longer than 12 characters. We're only printing shorter names.
    if name.length < 12
      if students.count == 0 then puts "Name: #{name}. Now we have #{students.count + 1} student." else puts "Name: #{name}. Now we have #{students.count + 1} students." end
      puts "Please enter their cohort."
      cohort = gets.chomp
      if !months.include?(cohort.downcase)
        puts "Unrecognised cohort. Assigning cohort: 'unknown'"
        cohort = :unknown
      else
        cohort = cohort.intern
      end
      students << {name: name, cohort: cohort}
      puts "Please enter the name of the next student, or ENTER to end."
    else
      # If it is longer, we do not print the student name.
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
  puts "The students of Villains Academy".center(80)
  puts "--------------------".center(80)
end

def print(s)
  months = [:january, :february, :march, :april, :may, :june, :july, :august,
            :september, :october, :november, :december, :unknown]
  group = s.group_by { |i| i[:cohort] }
  months.each do |y|
    counter = 0
    if !group[y].nil?
      until group[y].count == counter
      puts "#{group[y][counter][:name]} (#{group[y][counter][:cohort]} cohort)".center(80)
      counter += 1
      end
    else
      counter = 0
    end
  end
end

def print_footer(names)
  if names.count == 1 then puts "Overall, we only have #{names.count} great student.".center(80) else puts "Overall, we have #{names.count} great students".center(80) end
end

# Then we call the functions.
print_header
print(students)
print_footer(students)
