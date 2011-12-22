require 'rubygems'
require 'sinatra'
set :root, File.dirname(__FILE__)

@items = ["html5_for_designers"]
get '/' do
  @items = ["html5_for_designers"]
  haml :index
end

get '/'+ "#{@items[0]}" do
  @items = ["html5_for_designers"]
  haml :"#{@items[0]}/index"
end

get '/'+ "#{@items[0]}/canvas" do
  @items = ["html5_for_designers"]
  haml :"#{@items[0]}/canvas"
end
get '/'+ "#{@items[0]}/audio" do
  @items = ["html5_for_designers"]
  haml :"#{@items[0]}/audio"
end
