var http = require('http'),
    sys = require('util');

http.request({ uri:'http://www.google.com' }, function (error, response, body) {
  if (error && response.statusCode !== 200) {
    console.log('Error when contacting google.com')
  }
  
  // Print the google web page.
  sys.puts(body);
});
