http = require "http"
onRequest = (requset, response) ->
    response.writeHead 200, "Context-Type": "text/plain"
    response.write "hello world!"
    response.end ''
(http.createServer onRequest).listen 8888
console.log "Server running on 0.0.0.0:8888"
