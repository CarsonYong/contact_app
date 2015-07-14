class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @number = number
  end
 
  def to_s
    # TODO: return string representation of Contact
    @name.to_s + " " + ","+ " " + @email.to_s
  end
 
  ## Class Methods
  class << self
    def create(contact)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      ContactDatabase.add(contact)


    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.read
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      #ContactDatabase.show
    end
    
  end
 
end
