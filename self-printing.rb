# This file reads and prints the source code of itself. Including this comment!

require 'CSV'

CSV.foreach(__FILE__) do |file|
    puts file
end

# This little program will print anything including....

# ....anything that I type as comments.

def evaluate_file(coolness)
  if coolness == true
    puts 'Yeah! This file prints all of this!'
  else
    puts 'Not cool?  Oh okay.'
  end
end
