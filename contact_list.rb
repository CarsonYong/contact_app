require_relative 'contact'
require_relative 'contact_database'


# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

@argv = ARGV[0] # change the var now to cmd


  if @argv == "help"
    puts "Here is a list of available commands: "
    puts "new  - Create a new contact"
    puts "list - List all contacts"
    puts "show - Show a contact"
    puts "find - Find a contact"
  end
  #help_response = gets.chomp.downcase
  if @argv == "new"
    puts "Enter in an email"
    email = STDIN.gets.chomp.downcase
    #puts ContactDatabase.unique?(email)

    #if ContactDatabase.unique?(email) == true
      puts "Enter in your first name"
      firstname = STDIN.gets.chomp.downcase  

      puts "Enter in your last name"
      lastname = STDIN.gets.chomp.downcase

      new_contact = Contact.new(firstname, lastname, email)
      Contact.create(new_contact)
    end
      #puts "Enter your number"
      #number = STDIN.gets.chomp.to_i
    #end
      #puts "#{@new_contact}"
  if @argv =="list"
    #ContactDatabase.read
    Contact.connection
    Contact.all 
    
  elsif @argv =="show"
      #puts "start"
      #puts ARGV
      #puts "end"
      #puts ARGV[0]
      #puts ARGV[1]
      #puts ARGV[1]
      #puts "start"
      puts Contact.show(ARGV[1].to_i)
    elsif @argv == "find"
      #puts ARGV[1]
      puts Contact.find(ARGV[1].to_s)

     elsif @argv == "findemail"
      puts Contact.find_by_email(ARGV[1].to_s)

    elsif @argv == "findlastnameemail"
      puts Contact.find_all_by_firstname(ARGV[1].to_s)
    elsif @argv == "findlastnameemail"
      puts Contact.find_all_by_firstname(ARGV[1].to_s)
         
         
    end



