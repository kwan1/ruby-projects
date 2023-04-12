EMAIL = "abc@email.com"
NAME = "abc"
PASSWORD = "1234"
VAULT = {sky: {content: "the sky is blue"}}
#sky = title and content is content of secrets.


#Define methods
def welcome_message
    puts "Welcome to the Vault"
end

def email_input
    puts "Please enter your email: "
    user_email = gets.chomp
end


#verify email and password
def get_email_input(attempt = 1)
    
    puts (attempt > 1 ? "Invalid email, you have #{5 - attempt} attempts left, please try again: " : "Please enter your email: ")   
    user_email = gets.chomp

        if attempt == 4
            puts "
            
            You have exceeded the maximum number of attempts, exiting the program...
            
            "
            exit_program
            exit
        end
    return true if user_email == EMAIL
    return false if attempt == 4
    get_email_input(attempt + 1)
   
    end


def get_password_input(attempt = 1)
    
    puts (attempt > 1 ? "Invalid password, #{5 - attempt} attempts left, try again: " : "Please enter your passowrd: ")
    user_password = gets.chomp
    if attempt == 4
        puts "

        You have exceeded the maximum number of attempts, exiting the program...
        
        "
        exit_program
        exit
    end
    return true if user_password == PASSWORD
    return false if attempt ==4
    get_password_input(attempt + 1)
end


def verify_password_input(user_password)
    if user_password != PASSWORD
        password_input
    end
end

def greet_user
    puts "Login successful, welcome #{NAME}!"
    puts "What would you like to do today?"       
end

def menu_options
    puts "1. Add a new secret to the vault"
    puts "2. View a secret from the vault"
    puts "3. Remove a secret from the vault"
    puts "4. Exit"
end


#ADDING SECRETS TO HASH
def add_secret
print "Please enter the secret you would like to store in the vault: "
new_secret = gets.chomp
VAULT[new_secret.to_sym] = {}
new_secret
end

def set_new_secret
    print "Please enter the title of the secret:"
    secret_title = gets.chomp
    VAULT[secret_title.to_sym] = {}
    secret_title
end

def set_new_secret_for(secret_content)
    print "
    
    Enter your secret content, make sure there's no one around to look at it: 
    
    "
    new_content = gets.chomp
    VAULT[secret_content.to_sym][:content] = new_content 
end

#REMOVE SECRETS FROM HASH
def remove_secret
    puts "
    
    Please enter the title of secret you would like to remove from the vault: "
    gets.chomp
end

def remove_secret_from_vault(secret_name)
    if VAULT[secret_name.to_sym] == nil
        puts "

        No such secret in the vault.
        
        "
    else
    VAULT.delete(secret_name.to_sym)
    puts "

    Secret has been removed from the vault.

    "
    end
end


#RETRIEVE SECRETS FROM VAULT
def retrieve_secret_from_vault
    puts " Please enter the secret you would like to view:  "
    gets.chomp
end

def retrieve_secret_content_frm_vault(secret_name)
    VAULT[secret_name.to_sym]
end

def display_secrets(secret_name, secret_content)
    if VAULT[secret_name.to_sym] == nil
        puts "

        No such secret in the vault.
        
        "
    
else
    puts "
    
    Here is the secret you've asked for: #{secret_name}"
    secret_content.each do |key, value|
        puts "

        #{key}: #{value}

        "
    end
end
end

def exit_program
        puts "Exiting the program, stay safe..."
end


def password_input
    gets.chomp
end

#---------------------------------------------- user selection
def handle_user_selection(user_selection)
case(user_selection)
when "1"
    new_secret = set_new_secret
    set_new_secret_for(new_secret)
when "2"
    puts "Please re-enter your password to view your secrets below"
    #user_password = password_input
    get_password_input
    requested_secret = retrieve_secret_from_vault
    secret_content = retrieve_secret_content_frm_vault(requested_secret)
    display_secrets(requested_secret, secret_content)

when "3"
    #user_password = password_input
    get_password_input
    secret_to_remove = remove_secret
    remove_secret_from_vault(secret_to_remove)
when "4"
    exit_program
    exit
else
        puts "Invalid selection, exiting the program to protect your secrets."
        exit
    end
end



#--calling methods
welcome_message

#verify email
# user_email = email_input
get_email_input

#verify password
#user_password = password_input
get_password_input

#Greet user
#user_email = NAME
greet_user

#loop and handle user selection
loop do
menu_options
user_selection = gets.chomp
handle_user_selection(user_selection)
end