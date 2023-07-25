class Person
    attr_reader :id, :name, :age
    attr_writer :name, :age
  
    @@id_counter = 0
  
    def initialize(name = "Unknown", age = 0, parent_permission = true)
      @name = name
      @age = age
      @parent_permission = parent_permission
      @id = @@id_counter += 1
    end
  
    def can_use_services?
      of_age? || @parent_permission
    end
  
    private
  
    def of_age?
      @age >= 18
    end
  end
  