# STEP 8 EXERCISE 4
# Rewrite the each() method that prints all students using while or until control flow methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  x = 0
  while x <= students.length - 1 do 
    puts "#{x + 1} #{students[x][:name]} (#{students[x][:cohort]} cohort)"
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students "
end

students = input_students
print_header
print(students)
print_footer(students)
