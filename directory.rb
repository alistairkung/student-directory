def input_students
  puts "Please enter he names of the students"
  puts "To finish, just hit return twice"
  #create empty array#
  students= []
  #get the first name
  name = STDIN.gets.gsub("\n",'')
  while !name.empty? do
    puts "Please enter this person's cohort"
    cohort= STDIN.gets.gsub("\n",'')
      if cohort.empty?
        cohort = "unknown"
      end
    students << {name: name, cohort: cohort}
    if students.count == 1
      word = "student"
    else
      word = "students"
    end
    puts "Now we have #{students.count} " + word
    # get another name from the user
    name = STDIN.gets.gsub("\n",'')
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
if students.count == 0
  puts "No students were entered."
else
  print_header
  print(students)
  print_footer(students)
end
