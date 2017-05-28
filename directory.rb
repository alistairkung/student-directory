def input_students
  puts "Please enter he names of the students"
  puts "To finish, just hit return twice"
  #create empty array#
  students= []
  #get the first name
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 1
  i=0
  while count != students.count+1
    puts students[i]
    i += 1
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
