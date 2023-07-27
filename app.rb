require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classrooms = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(attrs = {})
    attrs[:classroom] = find_or_create_classroom(attrs[:classroom_name]) if attrs[:type] == 'student'
    person = create_student_or_teacher(attrs)

    @people << person
    puts "#{attrs[:type]} created successfully"
  end

  def create_student_or_teacher(attrs = {})
    case attrs[:type]
    when 'student'
      Student.new(attrs[:age], attrs[:classroom], name: attrs[:name], parent_permission: attrs[:parent_permission])
    when 'teacher'
      Teacher.new(attrs[:age], attrs[:specialization], name: attrs[:name], parent_permission: attrs[:parent_permission])
    else
      puts 'Invalid person type'
      nil
    end
  end

  def find_or_create_classroom(classroom_name)
    classroom = @classrooms.find { |c| c.label == classroom_name }
    return classroom unless classroom.nil?

    new_classroom = Classroom.new(classroom_name)
    @classrooms << new_classroom
    new_classroom
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental(date, book_title, person_id)
    book_to_rent = @books.find { |b| b.title == book_title }
    person_to_rent = @people.find { |p| p.id == person_id }

    return puts "No book with title: #{book_title}" if book_to_rent.nil?
    return puts "No person with ID: #{person_id}" if person_to_rent.nil?

    rental = Rental.new(date, book_to_rent, person_to_rent)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_all_rentals_for_person_id(person_id)
    rentals_for_person = @rentals.select { |rental| rental.person.id == person_id }
    rentals_for_person.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}"
    end
  end
end
