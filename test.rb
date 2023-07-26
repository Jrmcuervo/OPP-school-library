require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'

# Create instances of each class
person = Person.new(17, name: 'Juan Jimenez', parent_permission: true)
student = Student.new(15, '10th grade', name: 'Maria Smith', parent_permission: true)
teacher = Teacher.new(40, 'Math', name: 'Mr. Claus', parent_permission: false)

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
