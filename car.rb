class Car
    attr_accessor :color
    
    def initialize
      @color = ask_for_color
    end
    
    def ask_for_color
      puts "What is the color of the car?"
      color = gets.chomp
      color
    end
  end
  
  # Create an empty array to store the car colors
  car_colors = []
  
  # Ask the user to input the color of their car 3 times
  3.times do
    car = Car.new
    car_colors << car.color
  end
  
  # Print out the array of car colors
  puts car_colors.inspect
  