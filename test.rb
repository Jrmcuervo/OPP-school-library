require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

# Create instances of Classroom
classroom_10th_grade = Classroom.new('10th grade')
classroom_math = Classroom.new('Math')

# Create instances of each class
person = Person.new(17, name: 'Juan Jimenez', parent_permission: true)
student = Student.new(15, classroom_10th_grade, name: 'Maria Smith', parent_permission: true)
teacher = Teacher.new(40, classroom_math, name: 'Mr. Claus', parent_permission: false)

# Test getters with descriptive outputs
puts "Person name: #{person.name}"
puts "Person age: #{person.age}"
puts "Person ID: #{person.id}"

puts "\nStudent name: #{student.name}"
puts "Student age: #{student.age}"
puts "Student ID: #{student.id}"
puts "Student classroom: #{student.classroom}"

puts "\nTeacher name: #{teacher.name}"
puts "Teacher age: #{teacher.age}"
puts "Teacher ID: #{teacher.id}"
puts "Teacher specialization: #{teacher.specialization}"

# Test setters with descriptive outputs
person.name = 'Johnny Doe'
person.age = 18
puts "\nPerson name after update: #{person.name}"
puts "Person age after update: #{person.age}"

# Test service usage permission with descriptive outputs
puts "\nCan Person use services?: #{person.can_use_services?}"
puts "Can Student use services?: #{student.can_use_services?}"
puts "Can Teacher use services?: #{teacher.can_use_services?}"

# Test student play_hooky
puts "\nStudent play hooky: #{student.play_hooky}"

person = Person.new(22, name: 'maximilianus')
puts "Person's correct name: #{person.correct_name}"
capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized person's correct name: #{capitalized_person.correct_name}"
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed person's correct name: #{capitalized_trimmed_person.correct_name}"

# Creating students with age, classroom, name, and parent_permission
Student.new(16, classroom_10th_grade, name: 'Carlos Torres', parent_permission: true)
Student.new(15, classroom_math, name: 'María Ruiz', parent_permission: false)

# Create books and people
book1 = Book.new('1984', 'George Orwell')
book2 = Book.new('Brave New World', 'Aldous Huxley')

person1 = Person.new(25, name: 'Miguel Jiménez')
person2 = Person.new(35, name: 'Patricia Ramírez')

# Create rentals
Rental.new('2023-08-15', book1, person1)
Rental.new('2023-08-20', book2, person1)
Rental.new('2023-08-22', book1, person2)

puts "#{person1.name}'s rentals:"
person1.rentals.each do |rental|
  puts "Book: #{rental.book.title}, Date: #{rental.date}"
end

puts "#{book1.title}'s rentals:"
book1.rentals.each do |rental|
  puts "Person: #{rental.person.name}, Date: #{rental.date}"
end
