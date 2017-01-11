# First, we put all students into the array 'students'
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "The Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# The we print them
puts "The students of Villains Academy"
puts "-------------------"
students.each do |student|
  puts student
end
# Lastly, the count:
puts "Overall, we have #{students.count} great students."
