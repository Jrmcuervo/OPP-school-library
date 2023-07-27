require_relative 'app'

def main
  app = App.new

  loop do
    display_menu
    option = gets.chomp

    case option
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      create_person(app)
    when '4'
      create_book(app)
    when '5'
      create_rental(app)
    when '6'
      list_rentals_for_person(app)
    when '7'
      puts 'Exit the app'
      break
    else
      puts 'Invalid option'
    end
  end
end

def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def create_person(app)
  puts 'Do you want to create a student (1) or a teacher (2)?'
  person_type = gets.chomp == '1' ? 'student' : 'teacher'

  puts 'Age?'
  age = gets.chomp.to_i

  puts 'Name?'
  name = gets.chomp

  puts 'Parent permission? [Y/N]'
  parent_permission = gets.chomp.downcase == 'y'

  if person_type == 'student'
    puts 'Classroom?'
    classroom_name = gets.chomp
    app.create_person(type: person_type, age: age, name: name, parent_permission: parent_permission,
                      classroom_name: classroom_name)
  else
    puts 'Specialization?'
    specialization = gets.chomp
    app.create_person(type: person_type, age: age, name: name, parent_permission: parent_permission,
                      specialization: specialization)
  end
end

def create_book(app)
  puts 'Title?'
  title = gets.chomp

  puts 'Author?'
  author = gets.chomp

  app.create_book(title, author)
end

def create_rental(app)
  app.create_rental
end

def list_rentals_for_person(app)
  puts 'Person id?'
  person_id = gets.chomp.to_i
  app.list_all_rentals_for_person_id(person_id)
end

main
