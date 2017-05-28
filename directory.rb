def input_students
  puts "Please enter he names of the students"
  puts "To finish, just hit return two times"
  #create empty array#
  students= []
  #get the first name
  name = gets.chomp
  while !name.empty? do
    puts "Please enter this person's hobby"
    hobby = gets.chomp
    puts "Please enter this person's height in cm"
    height = gets.chomp
    students << {name: name, hobby: hobby, height: height, cohort: :november}
    puts "Now we have #{students.count} students. Enter another name or press enter two times to exit."
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
  students.each.with_index do |student, index|
    puts "#{index+1}. #{student[:name]} height: #{student[:height]}cm hobby: #{student[:hobby]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
