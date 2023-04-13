class Book

    attr_accessor :title, :author, :pages

def initialize(title,author,pages)
    @title = title
    @author = author
    @pages = pages
end

def print_books
    puts "This book is called: #{title} and it is written by #{author} and it has #{pages} pages"
end
end

book1 = Book.new("Harry Potter", "JK Rowling" , "400").print_books
book2 = Book.new("The Lord of the Rings", "Tolkien" , "388").print_books
book3 = Book.new("The Shinning", "Stephen King" , "447").print_books