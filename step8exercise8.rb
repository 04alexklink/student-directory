# STEP 8 EXERCISE 8
# Once you complete the previous exercise, change the way the users are displayed: 
# print them grouped by cohorts. To do this, you'll need to get a list of all existing
# cohorts (the map() method may be useful but it's not the only option), iterate over it
# and only print the students from that cohort.
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
  people_by_cohort = {}
  students.each do |student|
    by_cohort = student[:cohort]
    if people_by_cohort[by_cohort] == nil
      people_by_cohort[by_cohort] = [student[:name], student[:age], student[:hobbies]]
    elsif people_by_cohort[by_cohort].push(student[:name]).push(student[:age]).push(student[:hobbies])
    end
  end 
  
  people_by_cohort.each do |by_cohort, name, age, hobbies|
    puts by_cohort, name, age, hobbies
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students ".center(40)
end

students = input_students
print_header
print(students)
print_footer(students)
