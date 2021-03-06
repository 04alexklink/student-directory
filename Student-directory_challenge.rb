#We are de-facto using CSV format to store data. However, Ruby includes a library to work with 
#the CSV files that we could use instead of working directly with the files. Refactor the code 
#to use this library.
require "csv"
@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name, cohort, age, hobbies = STDIN.gets.chomp, STDIN.gets.chomp, "25".to_sym, :Tennis
  while !name.empty? do
    cohort = "Unknown" if cohort.empty?
    add_students(name, cohort, age, hobbies)
    puts "Now we have #{@students.count} student" if @students.length == 1
    puts "Now we have #{@students.count} students" if @students.length >= 2
    name, cohort, age, hobbies = STDIN.gets.chomp, STDIN.gets.chomp, "25".to_sym, :Tennis
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
  puts "3. Save the list to students.csv"
  puts "4. Load the saved students from students.csv"
  puts "9. Exit" # 9 because we'll be adding more options.
end

def show_students
  print_header
  print_students_list
  print_footer
end

def menu_selection(selection)
  case selection 
    when "1" then puts "You chose 'Input the students" 
      input_students
    when "2" then puts "You chose 'Show the students'"
      show_students
    when "3" then puts "You chose 'Save the list to students.csv'"
      save_students
    when "4" then puts "You chose 'Load the saved students from students.csv'"
      load_students
    when "9" then puts "You chose 'exit'"
      exit # this will cause the program to terminate
    else 
      puts "I don't know what you meant. Try again please."
  end 
end

def interactive_menu
  loop do
    print_menu
    menu_selection(STDIN.gets.chomp)
  end
end

def add_students(name, cohort, age, hobbies)
  @students << {name: name, cohort: cohort.to_sym, age: age, hobbies: hobbies}
end

def save_students
  # open the file for writing
  #File.open("students.csv", "w") do |file|
  # iterate over array of students
  #  @students.each do |student|
   #   file.puts [student[:name], student[:cohort], student[:age], student[:hobbies]].join(",")
  #  end
  #end
  CSV.open("students.csv", "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:age], student[:hobbies]]
    end
  end
end

def load_students(filename = "students.csv")
  #open the file for reading
  #File.open(filename, "r") do |file|
   # file.readlines.each do |line|
    #  name, cohort, age, hobbies = line.chomp.split(",")
     # add_students(name, cohort, age, hobbies)
    #end
  #end
  CSV.foreach(filename) do |row|
    name, cohort, age, hobbies = row
    add_students(name, cohort, age, hobbies)
  end
end

def default_file_startup
  ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first 
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
  puts "Sorry, but #{filename} doesn't exist."
  exit #quit
  end
end

default_file_startup
interactive_menu
