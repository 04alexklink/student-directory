# STEP 8 EXERCISE 7
# In the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort? What if one
# of the values is empty? Can you supply a default value? The input 
# will be given to you as a string. How will you convert it to a symbol?
# What if the user makes a typo?
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

def print(students)
  x = 0
  students.each do |student| 
    puts "#{x + 1}. Name: #{student[:name]} (Cohort: #{student[:cohort]})".center(40)
    puts "(Age: #{student[:age]}) (Hobbies: #{student[:hobbies]})".center(40)
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students ".center(40)
end

students = input_students
print_header
print(students)
print_footer(students)
