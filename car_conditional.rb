EMAIL = "123@email.com"
PASSWORD = "1234"
CAR_VAULT = {make: {name: "Toyota", model: "Camry"}, year: "2022"}

def welcome_message
    puts "Welcome to the car database."
end

def prompt_user_for_email
    puts "Please sign in to continue."
    print "Enter Email: "
    gets.chomp
end

def verify_user_email(user_email)
    if user_email != EMAIL
        puts "Invalid email"
        exit
    end
end

def prompt_user_for_password
    puts "Please enter your password: "
    gets.chomp
end

def verify_user_password(user_password)
    if user_password != PASSWORD
        puts "Incorrect Password"
        exit
    end
end

def greet_user(user_email)
        puts "Hello, #{user_email}."
        puts "What would you like to do?"
    end

def menu_options
        puts "1. Add a new car"
        puts "2. Retrieve an existing car"
        puts "3. Exit"
        
end

def get_user_menu
    gets.chomp
end

def handle_user_selection(user_selection)
    case user_selection

    when "1"
        new_car_name = set_new_car_name
        set_carname_for(new_car_name)
        set_makename_for(new_car_name)
        set_year_for(new_car_name)

    when "2"
        requested_car = retrieve_car_name
        car_make = retrieve_car_make_for(requested_car)
        car_year = retrieve_car_year_for(requested_car)
        display_car_model(requested_car, car_make, car_year)

    else
        exit_program
    end
end 

def set_new_car_name
    print "Please enter the name of the car: "
    new_make = gets.chomp
    CAR_VAULT[new_make.to_sym] = {}
    new_make
end

def set_carname_for(carname)
    print "Please enter make of car: "
    new_carname = gets.chomp
    CAR_VAULT[carname.to_sym][:name] = new_carname
end

def set_year_for(carname)
    print "Please enter the year of the car: "
    new_year = gets.chomp
    CAR_VAULT[carname.to_sym][:year] = new_year
end
def set_makename_for(carname)
    print "Please enter the model of the car: "
    new_makename = gets.chomp
    CAR_VAULT[carname.to_sym][:model] = new_makename
end

def retrieve_car_name
    print "Please enter the type of vehicle: "
    gets.chomp
end

def retrieve_car_make_for(carname)
    CAR_VAULT[carname.to_sym]
end

def retrieve_car_year_for(caryear)
    CAR_VAULT[caryear.to_sym]
end

def display_car_model(carname, car_make, caryear)
    puts "Here are the details for #{carname}: "
    car_make.each do |key, val, year|
        puts "#{key}: #{val} #{year}"
    end 
end

    def exit_program
        puts "Thank you for using the car database."
        exit
    end

    welcome_message
    user_email = prompt_user_for_email
    verify_user_email(user_email)
    user_password = prompt_user_for_password
    verify_user_password(user_password)
    greet_user(user_email)

    loop do
        menu_options
        user_selection = get_user_menu
        handle_user_selection(user_selection)
    end