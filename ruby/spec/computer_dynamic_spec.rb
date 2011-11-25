require "data_source.rb"
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def self.define_component(name)
    define_method(name) {
      info = @data_source.send "get_#{name}_info" , @id
      price = @data_source.send "get_#{name}_price" , @id
      result = "#{name.to_s.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result 
    }
  end
    define_component :cpu #why symbol
    define_component :mouse
    define_component :keyboard
  
end

describe "test computer" do

  before(:each) do
    @com = Computer.new(42, DS.new) 
  end
  
  it "test method dynamicly" do
    @com.cpu.should == "* Cpu: 2.16 Ghz ($220)"
    @com.mouse.should == "Mouse: Dual Optical ($40)"
    @com.keyboard.should == "Keyboard: Standard UK ($20)"
  end
end
