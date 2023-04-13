class Person
    attr_accessor :name

    def initialize(name)
         @name = name
    end

end
#empty array


#define a method that ask user to put their name and then add it to the array
def add_person
    people = []
    puts "Hi, what is your name?"
    @name = gets.chomp
    person = Person.new(@name)
    people.push(person)
end

def greet_user
    puts "Hi #{@name.capitalize}, how are you?"
end

add_person
greet_user