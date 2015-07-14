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
    puts ContactDatabase.unique?(email)

    if ContactDatabase.unique?(email) == true
      puts "Enter in a name"
      name = STDIN.gets.chomp.downcase  
      new_contact = Contact.new(name, email, number)
      Contact.create(new_contact)
      puts "Enter your number"
      number = STDIN.gets.chomp.to_i
    end
      #puts "#{@new_contact}"
  elsif @argv =="list"
    #ContactDatabase.read
    Contact.all 

  elsif @argv =="show"
      #puts "start"
      #puts ARGV
      #puts "end"
      #puts ARGV[0]
      #puts ARGV[1]
      #puts ARGV[1]
      #puts "start"
      Contact.show(ARGV[1].to_i)
    elsif @argv == "find"
      #puts ARGV[1]
      ContactDatabase.find(ARGV[1].to_s)
    end



