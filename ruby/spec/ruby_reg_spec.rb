describe "regular expression" do
  it "literal characters" do
    (/ruby/ =~ "ruby").should == 0
    /ruby/.should     =~ "ruby"
    /ruby/.should_not =~ 'Ruby'
  end
  it "character classes" do
    /[Rr]uby/.should         =~ "Ruby"
    /[Rr]uby/.should         =~ "ruby"
    /[aeiou]/.should         =~ "ai" # match any one lowercase vowel
    /[aeiou]/.should         =~ "aw"
    /[aeiou]/.should_not     =~ "w"
    /[a-z]/.should           =~ 'b'
    /[a-zA-Z]/.should        =~ 'aZ'
    /[^aeiou]/.should_not    =~ 'o' # match anything other than a lowercase vowel
    /[^aeiou]/.should        =~ 'wo'
  end
  it "special character classes" do
    /./.should       =~ "what"
    /./.should       =~ "/n" # /./m in mutiline mode . matches newlines, too
    # /\d/.should_not =~ 1 # /[0-9]/ only string get
    /\d/.should      =~ '1'
    /\D/.should_not  =~ '1'
    /\s/.should      =~ " " # match a whitespace character: /[[ \t\r\n\f]/
    /\S/.should_not  =~ " "
    /\s+/.should     =~ "  " # match one or more whitespace
    /\w/.should      =~ "who" # ? match a single word character:/[a-zA-Z0-9]_/
  end
  it "repetition" do
    /ruby?/.should     =~ "rub"
    /ruby?/.should     =~ "ruby" # match "rub" or "ruby"
    /ruby*/.should     =~ "rub"
    /ruby*/.should     =~ "rubyyy"
    /ruby+/.should_not =~ "rub"
    /ruby+/.should     =~ "rubyyyy"
    /\d{3}/.should_not =~ "12"
    /\d{3}/.should     =~ "123"
    /\d{3}/.should     =~ "1234"  # ?
    /\d{3,}/.should    =~ "1234"
    /\d{3,5}/.should   =~ "123456"  # ??
    /\d{3,5}/.should   =~ "12345"
  end
  it "i test" do
    "hello" =~ /e\w{2}/
    # $~.should == "" got  #<MatchData "ell"> Regexp.last_match
    $&.should == "ell" # Regexp.last_match[0]

    $~.to_s.should == "ell"
    $~.string.should == "hello"
    $`.should == "h"  # pre_match
    $'.should == "o"  # post_match
    $1.should == nil # Regexp.last_match[1]
    $2.should == nil # Regexp.last_match[2]
    # $+.should == $& # Regexp.last_match[-1]
    /a{2}z/.should =~ "aaz"
  end
  it "about match" do
    # /l/.match('hello').should == #<MatchData "l">
    (/l/ =~ "hello").should == 2
  end
  it "about String[] or slice(!)" do
    string = "hello123"
    string[/\d/].should      == "1"
    string[/\d+/].should     == "123"
    string[/\d{ 2 }/].should == nil # whitespace case
    string[/\d{2}/].should   == "12"
  end
  it "about String split" do 
    string = "one,three,two"
    string.split.should             == ["one,three,two"]
    string_other = "one, three, two"
    string_other.split.should_not   == ["one","three","two"]
    string_other.split.should       == ["one,","three,","two"]  
    string_other.split(", ").should == ["one","three","two"]
  end
  it "about String gsub(!) and sub(!)" do
    s = "hello,ruby!"
    s.sub("ruby","rails").should == "hello,rails!"
    s.sub("l","L").should == "heLlo,ruby!"
    s.gsub("l","L").should == "heLLo,ruby!"
    s.gsub(/e\w{2}o/,"i").should == "hi,ruby!"
  end
end
