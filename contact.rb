class Contact

 require 'pg'
  attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email, id = nil)
    # TODO: assign local variables to instance variables
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
    #@number = number
    #self.save
  end


  #   def initialize(hash)
  #   @id = hash["id"].to_i if hash["id"]
  #   @firstname = hash["firstname"]
  #   @lastname= hash["lastname"]
  #   @email = hash["email"]
  # end

 def save
  
  #puts @id
  arr = []

   self.class.connection.exec("SELECT * FROM contacts where email = '#{self.email}';") do | result|
    result.each do |row|
      arr << row
    end
  end


  # if email != false
  #   id = email.getvalue(0,0)
  # else 
  #   id = false
  # end

  #return

  if !arr.empty?

    #if id
    record = arr[0]
    id = record['id']
      #print id
      #return


      sql = "UPDATE contacts SET firstname=$1, lastname=$2, email=$3 where id = #{id};"
      self.class.connection.exec_params(sql, [self.firstname,self.lastname, self.email] )
    else
      sql = 'INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) RETURNING id'
      result = self.class.connection.exec_params(sql, [self.firstname, self.lastname, self.email])
      @id = result[0]["id"].to_i
    end

    @@conn.close
  end

#def self.find
 # self.class.connection.exec("SELECT * FROM contacts where id = ")

#end





 
  def to_s
    # TODO: return string representation of Contact
    @firstname.to_s + " " + @lastname.to_s + ","+ " " + @email.to_s
  end


  def destroy
    #id = 11

    Contact.connection.exec("DELETE FROM contacts WHERE id = '#{self.id}';")
    #result.each do |row|
    #retrun result
    #end
  #end



  end
 
  ## Class Methods
  class << self
    def create(contact)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      #ContactDatabase.add(contact)
      contact.save

    end
 
    def find(id)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      #ContactDatabase.find(term)

      Contact.connection.exec("SELECT * FROM contacts where id = #{id}") do | result|
       result.each do |row|
        #row = Contact.new
        #puts row
        @person = Contact.new(row["firstname"], row["lastname"], row["email"], row["id"])
        return @person
      end
      
    end
      #@test1
    end

    def find_all_by_lastname(lastname)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      #ContactDatabase.find(term)

      Contact.connection.exec_params("SELECT * FROM contacts where lastname =$1;", [lastname]) do | result|
      result.each do |row|
        
      end
      return row
    end

    end

        def find_all_by_firstname(firstname)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      #ContactDatabase.find(term)

      Contact.connection.exec_params("SELECT * FROM contacts where firstname =$1;", [firstname]) do | result|
      result.each do |row|
        
      end
      return row
    end

    end

    def find_by_email(email)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      #ContactDatabase.find(term)

      Contact.connection.exec_params("SELECT * FROM contacts where email=$1;", [email]) do | result|
      result.each do |row|
        return row
      end
      return row
    end

    end







 
    def all
      # TODO: Return the list of contacts, as is
      #ContactDatabase.read

      arr = []
      Contact.connection.exec("SELECT * FROM contacts;") do | result|
      result.each do |row|
        arr << row

      end
      
       arr
    end

    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      ContactDatabase.show(id)
    end


    
  end

    def self.connection
      puts 'Connecting to the database...'
      @@conn = PG.connect(
      host: 'localhost',
      dbname: 'contact_app',
      user: 'development',
      password: 'development'
    )

      #conn.exec("insert into contacts values (firstnameq, 'lastnameq', 'q3test@example.com');")
     # puts 'Closing the connection...'
      #conn.close
      #return conn
      #puts 'DONE'

    end
 
end
