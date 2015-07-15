## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase 

  def self.add(contact)

    id = CSV.read("contact.csv")
    id = id.length
    id += 1


    CSV.open("contact.csv", "ab") do |csv|
     #id = csv.length += 1
      csv << [id, contact.name, contact.email]
    end
  end

  def self.read()
    CSV.foreach("contact.csv") do |row|
      puts row.join(" ")
    end
  # use row here...
  end
  def self.show(id)
    test = false
    CSV.foreach("contact.csv") do |row|
      #puts row[0].to_i == id.to_i

      if row[0].to_i == id.to_i
        test = true
        return row
      #elsif row[0].to_i != id.to_i
      #puts "That contact cannot be found.
      end
    end
    if test == false
      return "Contact cannot be found "
    end
  end
  def self.find(contact)
    test = false
    CSV.foreach("contact.csv") do |row|
      if row[1].match(contact.to_s)
        test = true
        return row
      end
    end
    if test == false
      return "cannot find contact"
    end
  end

  def self.unique?(email)
    test = true
    CSV.foreach("contact.csv") do |row|
      if row[2].match(email.to_s)
        test = false
      end
    end    
    if test == false
      puts "Contact already exists"
    end
    test
  end
end

