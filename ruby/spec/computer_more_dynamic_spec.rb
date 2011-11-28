require "data_source.rb"
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) {
      info = @data_source.send "get_#{name}_info" , @id
      price = @data_source.send "get_#{name}_price" , @id
      result = "#{name.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result 
    }
  end
   
end

describe "test computer" do

  before(:each) do
    @data_source = DS.new
    @com = Computer.new(42, @data_source) 
  end
  
  it "test method dynamicly" do
    @com.cpu.should == "* Cpu: 2.16 Ghz ($220)"
    @com.mouse.should == "Mouse: Dual Optical ($40)"
    @com.keyboard.should == "Keyboard: Standard UK ($20)"
  end
  it "test data_source's methods.grep" do
    @data_source.methods.grep(/get/).should == [
        :get_mouse_info,
        :get_mouse_price,
        :get_keyboard_info,
        :get_keyboard_price,
        :get_cpu_info,
        :get_cpu_price,
        :get_display_info,
        :get_display_price,
        :instance_variable_get]
    @data_source.methods.grep(/^get/).should == [
        :get_mouse_info,
        :get_mouse_price,
        :get_keyboard_info,
        :get_keyboard_price,
        :get_cpu_info,
        :get_cpu_price,
        :get_display_info,
        :get_display_price]
    @data_source.methods.grep(/^get(.*)info$/).should == [
        :get_mouse_info,
        :get_keyboard_info,
        :get_cpu_info,
        :get_display_info]    
  end
end
