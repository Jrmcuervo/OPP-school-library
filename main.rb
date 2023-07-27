require_relative 'app'

def main
  app = App.new

  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp

    case option
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
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
        classroom = gets.chomp
        app.create_person(person_type, age, name, parent_permission, classroom)
      else
        puts 'Specialization?'
        specialization = gets.chomp
        app.create_person(person_type, age, name, parent_permission, nil, specialization)
      end
    when '4'
      puts 'Title?'
      title = gets.chomp

      puts 'Author?'
      author = gets.chomp

      app.create_book(title, author)
    when '5'
      puts 'Date?'
      date = gets.chomp

      puts 'Book title?'
      book_title = gets.chomp

      puts 'Person id?'
      person_id = gets.chomp.to_i

      app.create_rental(date, book_title, person_id)
    when '6'
      puts 'Person id?'
      person_id = gets.chomp.to_i
      app.list_all_rentals_for_person_id(person_id)
    when '7'
      puts 'Exit the app'
      break
    else
      puts 'Invalid option'
    end
  end
end

main
