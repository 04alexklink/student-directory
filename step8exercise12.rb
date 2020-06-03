# STEP 8 EXERCISE 12
# What happens if the user doesn't enter any students? It will try to print an empty list. 
# How can you use an if statement (Control Flow) to only print the list if there is at least
# one student in there?
def input_students
  puts "Please enter the names of the students and their corresponding cohort"
  puts "Please provide a name first, followed by their cohort"
  puts "To finish, just hit quit"
  students = []
  name = gets.chomp
  cohort = gets.chomp
  while name != "quit" do
    cohort = "unknown" if cohort.empty? 
    name = "unknown" if name.empty?
    puts "check your answer, type yes for correct, type no to redo"
    puts "name = #{name}, cohort = #{cohort}"
    check = gets.chomp
    if check == "yes"
      students << {name: name, cohort: cohort.to_sym, age: :"25", hobbies: :tennis}
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
    cohort = gets.chomp
  end
  students 
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_students(students)
  if students[0][:name] == "unknown" && students.length == 1
    puts "No students entered!"
  elsif
    x = 0
    students.each do |student| 
      puts "#{x + 1}. Name: #{student[:name]} (Cohort: #{student[:cohort]})".center(40)
      puts "(Age: #{student[:age]}) (Hobbies: #{student[:hobbies]})".center(40)
      x += 1
    end
  end
end

def print_footer(students)
  unless students[0][:name] == "unknown" && students.length == 1
    puts "Overall, we have #{students.count} great students ".center(40)
  end
end

students = input_students
print_header
print_students(students)
print_footer(students)
