require 'pry'
require 'byebug'
require_relative 'contact'
require_relative 'contact_database'
require_relative 'contact_list'


#new_person = Contact.new("booo", "test", "fon@carson.com")
#new_person.save

#person = Contact.new("foo", "record", "carson@fefewf.com")
#person.save

# test = Contact.find_all_by_lastname('rereg')
# puts test

# test = Contact.all
# puts test

# test = Contact.find_by_email('fon@carson.com')
# puts test

# DELETE FROM table_name
# WHERE some_column=some_value;

# new_person = Contact.new("boooreewrewer", "teserewrewfret", "fonreewerewrwef@carson.com")
# new_person.save
# new_person.destroy
# puts new_person.email


#new_person.destroy

# Contact.destroy
# def self.all
#     self.connection.exec('SELECT * FROM countries;') do |results|
#       results.map do |hash|
#         Country.new(hash)
#       end
#     end
#   end


@test = Contact.find(1)
@test.destroy