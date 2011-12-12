class RubyString < RSpec::Core::ExampleGroup
  def hello_ruby_string
    "Hello RubyString"
  end
end

describe "just hello!" do
    it "first test" do
      a = RubyString.new
      b = a.hello_ruby_string
      b.should == "Hello RubyString"
    end
end
describe "some others" do
  before(:each) do
    @a = 'it\'s me'
  end
  it "test \\" do
    @a.should == 'it\'s me' 
  end
  it "test #{}" do
    'this is #{@a}'.should == "this is \#{@a}"#是在双引号中应用#{}
    "this is #{@a}".should_not == "this is \#{@a}"
    "this is #{@a}".should_not == "this is 'it's me'"#既然是内插法，应该是没有‘’的了
    "this is #{@a}".should == "this is it's me"
    "this is #{@a}".should == "this is #@a"#全局变量，实例变量，类的变量的使用可以省去{}
  end
  it "test unicodes" do
    #"\u00D7".should == "x"#error:
    #"\u00A5".should == "¥"
  end
  it "test fen jie fu" do
    %q(hello ruby!).should == "hello ruby!"
    %q{hello ruby!}.should == %q(hello ruby!)
    %Q{as}.should == %q(as)
    %q{as}.should == %q(as) 
  end
end

describe "String Methods" do
  before(:each) do
    @a = "Hello Ruby!"
  end
  
  it "counts characters in a string" do
    @a.length.should == 11
    @a.size.should == 11 #'章'.size --error
  end
  
  it "converts a string to capitalizes" do
    @a.capitalize.should == "Hello ruby!" #how can be "Hello Ruby!" 
  end

  it "removes ending\n,\r,\t" do
    b = @a << '\n' #@a << '\n' is not work
    b.chomp.should == "Hello Ruby!\\n"
  end
  
  it "convert a string to lowcase" do
    @a.downcase.should == "hello ruby!"
  end
  
  it "question a string about empty" do
    @a.empty?.should == false
    @a.clear.empty? == true
    
  end
  
  it "removes leading white space(s) in a string" do
    @a = "  Hello Ruby!"
    @a.lstrip.should == 'Hello Ruby!'#how about kuochong?
  end
  
  it "removes tailing white space(s) in a string" do
    b = @a << '  '
    b.rstrip.should == "Hello Ruby!"
  end
  
  it "removes white space(s) in a string" do
    @a = " hello  "
    @a.strip.should == 'hello'
  end
   
  it "converts s string in reverse order" do
    @a.reverse.should == "!ybuR olleH"
  end
  
  it "converts a string's every caracters to upcase" do
   @a.upcase.should == "HELLO RUBY!"#how about dowcase
   @a.upcase!
   @a.downcase.should == "hello ruby!"
  end
  
  it "extracts the character(s) in a string" do
    @a.slice(-1,1).should == '!'
    @a.slice(0).should == "H"
    @a.slice!(0).should == "H"
    @a.should == 'ello Ruby!'
    @a.slice(1..2).should == "ll"
  end
  
  it 'add the caracters to a string' do
    @a.insert(0,'H').should == "HHello Ruby!"
    @a.insert(-1,'?').should == "HHello Ruby!?"#not "Hello  Ruby?!"
    @a.insert(-3,'y').should == "HHello Rubyy!?"
  end
  
  it 'Convert a string to array' do
    @a.split.should == ["Hello", "Ruby!"]
  end
  
end
