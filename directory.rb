require 'csv'
@students= [] #empty array accessable to all methods

def append_to_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter he names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.gsub("\n",'')
  while !name.empty? do
    puts "Please enter this person's cohort"
    cohort= STDIN.gets.gsub("\n",'')
      if cohort.empty?
        cohort = "unknown"
      end
    append_to_students(name, cohort)
    if @students.count == 1
      word = "student"
    else
      word = "students"
    end
    puts "Now we have #{@students.count} " + word
    # get another name from the user
    name = STDIN.gets.gsub("\n",'')
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from stduents.csv"
  puts "9. Exit"
end

def show_students
  if @students.count == 0
    puts "No students were entered."
  else
    print_header
    print_students_list(@students)
    print_footer(@students)
  end
end

def save_students
  #open the file
  CSV.open("students.csv", "w") {|file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data
    end
  }
end

def load_students(filename = "students.csv")
  CSV.foreach(filename, "r") do |line|
    name, cohort = line[0], line[1]
    append_to_students(name, cohort)
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you nean, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list(students)
  students.each.with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

try_load_students
interactive_menu
