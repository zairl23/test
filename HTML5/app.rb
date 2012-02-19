require 'rubygems'
require 'sinatra'
set :root, File.dirname(__FILE__)

#@items = {"html5_for_designers", 
#        "HTML5_and_JavaScript_Projects" => []


class Route 
  def initialize(item)
    @item = item
  end
  def route
    if @item == "/"
      get "/" do
        haml :index
      end
    elsif @item.include?("/")
      get "/" + @item do
        haml :@item
      end
    else
      get "/#{@item}" do |@item|
        # get do belongs who? 
        haml :"#{@item}/index"
      end
    end
  end 
end
@menu = [['/'], ["html5_for_designers"], ["HTML5_and_JavaScript_Projects","Building the HTML5 Logo"]]

Route.new("/").route
Route.new("html5_for_designers").route


