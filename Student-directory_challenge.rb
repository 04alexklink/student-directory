@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  while !name.empty? do
    cohort = "Unknown" if cohort.empty?
    @students << {name: name, cohort: cohort.to_sym, age: :"25", hobbies: :Tennis}
    puts "Now we have #{@students.count} student" if @students.length == 1
    puts "Now we have #{@students.count} students" if @students.length >= 2
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
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

def process(selection)
  case selection 
    when "1"
      #input the students
      input_students
    when "2"
      #show the students
      show_students
    when "3"
      #save the students
      save_students
    when "4"
      #load the students
      load_students
    when "9"
      exit # this will cause the program to terminate
    else 
      puts "I don't know what you meant. Try again please."
  end 
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  #open the file for reading
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, age, hobbies = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym, age: age, hobbies: hobbies}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
  puts "Sorry, but #{filename} doesn't exist."
  exit #quit
  end
end

try_load_students
interactive_menu

