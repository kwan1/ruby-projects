PEOPLE = []

count = PEOPLE.length
class Person

    attr_accessor :name, :age
    def initialize(name)
         @name = name
         @age = age
    end

end


#define a method that ask user to put their name and then add it to the array
def add_person
    puts "Hi, what is your name?"
    @name = gets.chomp
    person = Person.new(@name)
    PEOPLE.push(person)
end

def age_user
    puts "How old are you?"
    @age = gets.chomp
    puts "Hi #{@name.capitalize}, you are #{@age} years old."
end

def greet_user
    puts "Hi #{@name.capitalize}, how are you?"

end


add_person
greet_user
age_user
puts "There are #{PEOPLE.length} people in the array."