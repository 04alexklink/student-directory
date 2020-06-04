def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    cohort = "Unknown" if cohort.empty?
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, age: :"25", hobbies: :Tennis}
    puts "Now we have #{students.count} student" if students.length == 1
    puts "Now we have #{students.count} students" if students.length >= 2
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(50)
end

def print_students_list(students)
  x = 1
  students.each do |student| 
    puts "#{x}. Name: #{student[:name]} (Cohort: #{student[:cohort]})".center(50)
    puts "(Age: #{student[:age]}) (Hobbies: #{student[:hobbies]})".center(50)
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student" if students.length == 1
  puts "Overall, we have #{students.count} great students" if students.length >= 2
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # because we'll be adding more variables
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection 
      when "1"
        #input the students
        students = input_students
      when "2"
        #show the students
        print_header
        print_students_list(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else 
        puts "I don't know what you meant. Try again please."
    end
  end
end

interactive_menu
