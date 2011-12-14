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
    a = "my name is neychang"
    
  end
  
end
