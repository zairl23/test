# http://hi.baidu.com/jiyinyiyong/blog/item/a0cdaa90851f6405d31b708a.html
http = require "http"
onRequest = (req,res) ->
  console.log "Request received."
  console.log res.typeof # undefined?
  res.writeHead 200, "Content-Type": "text/plain"
  res.write "Hello World!I'm Neychang\n"
  res.end "I'm learning NodeJS"
(http.createServer onRequest).listen 8888
console.log "Server has stared on 0.0.0.0:8888"

