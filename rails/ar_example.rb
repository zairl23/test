require 'rubygems'
require 'active_record' # not 'activerecord'
ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "ducks.sqlite3" # not "ducks"
                                        
class Dog < ActiveRecord::Base
  validates_length_of :name, :maximum => 6
end

a_dog = Dog.new
a_dog.name = "Ney"
if a_dog.valid?
  a_dog.save! 
  puts "a_dog is saved!"
else 
  puts "a_dog isn't saved!"
end
