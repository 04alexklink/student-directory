# STEP 8 EXERCISE 6
# Research how the method center() of the String class works.
# Use it in your code to make the output beautifully aligned.
# Note: I used .center method with an argument line 24. 
# Note: I used .center method on line 32 and 33. 
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, age: :"25", hobbies: :tennis}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(35, "xxx")
end

def print(students)
  x = 0
  students.each do |student| 
    puts "#{x + 1} #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    puts "(age: #{student[:age]}) (hobbies: #{student[:hobbies]})".center(50)
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
