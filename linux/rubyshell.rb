# from http://tech.natemurray.com/2007/03/ruby-shell-commands.html
# using ``
 'ls'
  ruby-1.9.2-p290 :002 > `ls`
 => "codebreaker\ncoffee\nfeatures\ngreeter_spec.rb\nHTML5\nlinux\nREADME\nruby\nsample_app\nspec\n" 

# use POP4
$ irb
  >> require "open4" 
  => true
  >> status = Open4::popen4("false") do |pid, stdin, stdout, stderr|
  ?>            puts "PID #{pid}" 
  >>          end
  PID 26598
  => #<Process::Status: pid=26598,exited(1)>
  >> puts status
  256
  => nil
  
# use 
$ irb
  >> require "open3" 
  => true
  >> stdin, stdout, stderr = Open3.popen3('false')
  => [#<IO:0x6f39c0>, #<IO:0x6f3984>, #<IO:0x6f3920>]
  >> $?
  => #<Process::Status: pid=26285,exited(0)>
  >> $?.to_i
  => 0

$ irb
  >> stdin, stdout, stderr = Open3.popen3('dc') 
  => [#<IO:0x6e5474>, #<IO:0x6e5438>, #<IO:0x6e53d4>]
  >> stdin.puts(5)
  => nil
  >> stdin.puts(10)
  => nil
  >> stdin.puts("+")
  => nil
  >> stdin.puts("p")
  => nil
  >> stdout.gets
  => "15\n" 

# use system
$ irb             
  >> system 'echo "hello $HOSTNAME"'
  hello nate.local
  => true
  >> system 'false' 
  => false
  >> puts $?
  256
  => nil
  >> 

# use exec
$ irb
  >> exec 'echo "hello $HOSTNAME"'
  hello nate.local
  $
