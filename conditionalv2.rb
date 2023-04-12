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
    
    puts (attempt > 1 ? "Invalid email, please try again. Note: you have #{4 - attempt} attempts left: " : "Please enter your email: ")   
    user_email = gets.chomp

        if attempt == 3
            if user_email == EMAIL
                return true if user_email == EMAIL
            else
            puts "
            
            You have exceeded the maximum number of attempts.
            Attempts counter: #{3 - attempt}
            Exiting the program...
            
            "
            exit_program
            exit
            end
        end
    return true if user_email == EMAIL
    return false if attempt == 3
    get_email_input(attempt + 1)
   
    end


def get_password_input(attempt = 1)
    puts (attempt > 1 ? "Invalid password, please try again. Note: you have #{4 - attempt} attempts left: " : "Please enter your password: ")
    user_password = gets.chomp
    if attempt == 3
        if user_password == PASSWORD
            return true if user_password == PASSWORD
        else
        puts "

        You have #{3 - attempt} attempts, exiting the program...
        
        "
        exit_program
        exit
        end
    end
    return true if user_password == PASSWORD
    return false if attempt ==3
    get_password_input(attempt + 1)
end


def verify_password_input(user_password)
    if user_password != PASSWORD
        password_input
    end
end

def greet_user
    puts "Login successful, welcome #{NAME.capitalize!}!"
    puts "What would you like to do today?"       
end

def menu_options
    puts "1. Add a new secret to the vault"
    puts "2. View a secret from the vault"
    puts "3. View all secrets in the vault"
    puts "4. Remove a secret from the vault"
    puts "5. Exit the program"
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
#RETREVE ALL SECRETS FROM VAULT
def retrieve_all_secrets
    VAULT.each do |key, value|
        puts "

        #{key}: #{value}

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
        puts "Exiting the program. Do not worry, your secrets are safe with us."
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
    puts "Re-enter your password to view your secrets below"
    #user_password = password_input
    get_password_input
    requested_secret = retrieve_secret_from_vault
    secret_content = retrieve_secret_content_frm_vault(requested_secret)
    display_secrets(requested_secret, secret_content)

when "3"
    get_password_input
    retrieve_all_secrets
when "4"
    #user_password = password_input
    get_password_input
    secret_to_remove = remove_secret
    remove_secret_from_vault(secret_to_remove)
when "5"
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