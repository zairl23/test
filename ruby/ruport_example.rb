require 'ruport'

table = Ruport::Data::Table.new :column_names => ["country", "wine"],
                        :data => [["France", "Bordeaux"],
 ["Italy", "Chianti"],
 ["France", "Chablis"]]
 
 puts table.to_text 
 # select only the French wines and convert them to comma-separated values:
found = table.rows_with_country("France")
found.each do |row|
  #puts row.to_csv undefined method `instance' for Ruport::Formatter::CSV:Class (NoMethodError)
  puts row.to_text 
end
#source codes--
#class Table
#def method_missing(id,*args,&block)
#return as($1.to_sym,*args,&block) if id.to_s =~ /^to_(.*)/
#return rows_with($1.to_sym => args[0]) if id.to_s =~ /^rows_with_(.*)/
#super
#Ghost Methods like rows_with_country( ) are just syntactic sugar
#end

          
