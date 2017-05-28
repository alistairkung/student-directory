def input_students
  puts "Please enter he names of the students"
  puts "To finish, just hit return twice"
  #create empty array#
  students= []
  #get the first name
  name = gets.chomp
  while !name.empty? do
    puts "Please enter this person's cohort"
    cohort= gets.chomp
      if cohort.empty?
        cohort = "unknown"
      end
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each.with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
