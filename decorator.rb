class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end
  
  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0...10] : name
  end
end
  
  
  