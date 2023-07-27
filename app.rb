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
  
    def create_person(type, age, name, parent_permission, classroom_name = nil, specialization = nil)
        person = case type.downcase
                 when 'student'
                   classroom = @classrooms.find { |c| c.label == classroom_name }
                   if classroom.nil?
                     classroom = Classroom.new(classroom_name)
                     @classrooms << classroom
                   end
                   Student.new(age, classroom, name: name, parent_permission: parent_permission)
                 when 'teacher'
                   Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
                 else
                   puts 'Invalid person type'
                   return
                 end
    
        @people << person
        puts "#{type} created successfully"
      end
  
    def create_book(title, author)
      book = Book.new(title, author)
      @books << book
      puts "Book created successfully"
    end
  
    def create_rental(date, book_title, person_id)
      book = @books.find { |book| book.title == book_title }
      person = @people.find { |person| person.id == person_id }
  
      if book.nil?
        puts "No book with title: #{book_title}"
        return
      end
  
      if person.nil?
        puts "No person with ID: #{person_id}"
        return
      end
  
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts "Rental created successfully"
    end
  
    def list_all_rentals_for_person_id(person_id)
      rentals_for_person = @rentals.select { |rental| rental.person.id == person_id }
      rentals_for_person.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}"
      end
    end
  end
  