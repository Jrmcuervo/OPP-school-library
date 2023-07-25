require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create instances of each class
person = Person.new("John Doe", 17)
student = Student.new("Jane Doe", 15, true, "10th grade")
teacher = Teacher.new("Mr. Smith", 40, false, "Math")

# Test getters
puts person.id
puts person.name
puts person.age

puts student.id
puts student.name
puts student.age
puts student.play_hooky

puts teacher.id
puts teacher.name
puts teacher.age

# Test setters
person.name = "Johnny Doe"
person.age = 18
puts person.name
puts person.age

# Test service usage permission
puts person.can_use_services?  # Should return true (person is now of age)
puts student.can_use_services? # Should return true (student has parent permission)
puts teacher.can_use_services? # Should return true (teacher is always allowed)

