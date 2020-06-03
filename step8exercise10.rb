# STEP 8 EXERCISE 10
# We've been using the chomp() method to get rid of the last return character. 
# Find another method among those provided by the String class that could be used
# for the same purpose (although it will require passing some arguments).
def input_students
  puts "Please enter the names of the students and their corresponding cohort"
  puts "Please provide a name first, followed by their cohort"
  puts "To finish, just hit quit"
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  while name != "quit" do
    cohort = "unknown" if cohort.empty? 
    name = "unknown" if name.empty?
    puts "check your answer, type yes for correct, type no to redo"
    puts "name = #{name}, cohort = #{cohort}"
    check = gets.chop
    if check == "yes"
      students << {name: name, cohort: cohort.to_sym, age: :"25", hobbies: :tennis}
      if students.length == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
    end
    name = gets.chomp
    cohort = gets.chomp
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
  students.each do |student| 
    puts "#{x + 1} #{student[:name]} (cohort: #{student[:cohort]})".center(50)
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
