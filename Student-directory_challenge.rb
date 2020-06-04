@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  cohort = gets.chomp
  while !name.empty? do
    cohort = "Unknown" if cohort.empty?
    @students << {name: name, cohort: cohort.to_sym, age: :"25", hobbies: :Tennis}
    puts "Now we have #{@students.count} student" if @students.length == 1
    puts "Now we have #{@students.count} students" if @students.length >= 2
    name = gets.chomp
    cohort = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(30)
end

def print_students_list
  x = 1
  @students.each do |student| 
    puts "#{x}. Name: #{student[:name]} (Cohort: #{student[:cohort]})".center(30)
    puts "(Age: #{student[:age]}) (Hobbies: #{student[:hobbies]})".center(30)
    x += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student" if @students.length == 1
  puts "Overall, we have #{@students.count} great students" if @students.length >= 2
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more options.
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection 
    when "1"
      #input the students
      input_students
    when "2"
      #show the students
      show_students
    when "9"
      exit # this will cause the program to terminate
    else 
      puts "I don't know what you meant. Try again please."
  end 
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
