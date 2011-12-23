# ecoding: utf-8
# 分析素数的特定。
# 找出1-100以内的所有素数
describe "match shushu" do
  it "find shushu in [1..100]" do 
    @a = []
    @b = []
    (6..100).each do |i|
      unless i % 2 == 0
         @i = i
         @c = (@i-1)/2 
         (2..@c).each do |m|
           @b << (@i % m) 
         end 
         unless @b.include?(0)
           @a << @i
           @b.clear
         end
      end
    end
    @a.should == [7]# 5791113
  end
  it "find shushu in [1..100] two" do
    a = (6..100).to_a
    a.each do |i|
      if (i % 2) == 0
        a.delete(i)
      end
    end
    b = a
    b.each do |i|  
      c = (i-1)/2
      #end
        (3..c).each do |m|
          if (i % m) == 0
            a.delete(i)
            break
          end
          
        end
    end 
    
    a.should == []
  end
end
