http = require "http"
(http.createServer (request, response) ->
  response.writeHead 200, "Content-Type": "text/plain"
  response.write "hello world!"
  response.end 'Server running on 0.0.0.0:8888'
).listen 8888
console.log "Server running on 0.0.0.0:8888"
