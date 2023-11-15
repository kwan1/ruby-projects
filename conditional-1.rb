EMAIL = "123@email.com"
NAME = "123"
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


#verify user email, you have 4 attempts
def verify_email_input(user_email)
    i = 0
    while user_email != EMAIL && i < 3
     puts "Invalid email, please try again, you have #{3 - i} attempts left"
     email_input 
        i += 1
    end
    if i == 3
        puts "Too many attempts, exiting the program"
        exit
    end
end

def password_input
    puts "Please enter your password: "
    user_password = gets.chomp
end


#verify password, you have 4 attempts
def verify_password_input(user_password)
    j = 0
    while user_password != PASSWORD && j < 3
        puts "Invalid password, please try again, you have #{3 - j} attempts left"
        password_input
        j += 1
    end
    if j == 3
        puts "Wayyy to many attempts bud, exiting the program, no secrets for you!"
        exit
    end
end

def greet_user(user_email)
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
    print "Enter your secret discreetly, make sure no one is around: "
    new_content = gets.chomp
    VAULT[secret_content.to_sym][:content] = new_content 
end

#REMOVE SECRETS FROM HASH
def remove_secret
    puts "Please enter the title of secret you would like to remove from the vault:"
    gets.chomp
end

def remove_secret_from_vault(secret_name)
    VAULT.delete(secret_name.to_sym)
end


#RETRIEVE SECRETS FROM VAULT
def retrieve_secret_from_vault
    puts "Please enter the secret you would like to view:"
    gets.chomp
end

def retrieve_secret_content_frm_vault(secret_name)
    VAULT[secret_name.to_sym]
end

def display_secrets(secret_name, secret_content)
    puts "Here is the secret you've asked for: #{secret_name}"
    secret_content.each do |key, value|
        puts "#{key}: #{value}"
    end
end

def exit_program
        puts "Exiting the program, stay safe..."
end




#---------------------------------------------- user selection
def handle_user_selection(user_selection)
case(user_selection)
when "1"
    new_secret = set_new_secret
    set_new_secret_for(new_secret)
when "2"
    puts "Please re-enter your password to view your secrets below"
    user_password = password_input
    verify_password_input(user_password)
    requested_secret = retrieve_secret_from_vault
    secret_content = retrieve_secret_content_frm_vault(requested_secret)
    display_secrets(requested_secret, secret_content)

when "3"
    puts "Please re-enter your password to view your secrets below"
    user_password = password_input
    verify_password_input(user_password)
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
user_email = email_input
verify_email_input(user_email)

#verify password
user_password = password_input
verify_password_input(user_password)

#Greet user
greet_user(user_email)

#loop and handle user selection
loop do
menu_options
user_selection = gets.chomp
handle_user_selection(user_selection)
end