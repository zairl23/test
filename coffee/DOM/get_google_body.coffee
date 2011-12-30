# http://blog.nodejitsu.com/jsdom-jquery-in-5-lines-on-nodejs
http = require "http"
sys  = require "util"

http.request(uri: "http://google.com",
  (error,response,body) ->
    if (error && response.statusCode != 200) 
      console.log('Error when contacting google.com')
    else
    # Print the google web page.
      sys.puts(body);
)
# console.log http.request.obtain    

