require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create instances of each class
person = Person.new(name: 'Juan Jimenez', age: 17, parent_permission: true)
student = Student.new(name: 'Maria Smith', age: 15, parent_permission: true, classroom: '10th grade')
teacher = Teacher.new(name: 'Mr. Claus', age: 40, parent_permission: false, specialization: 'Math')


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
