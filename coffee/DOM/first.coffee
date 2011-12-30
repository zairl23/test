# http://www.whatwg.org/specs/web-apps/current-work/multipage/dom.html#document
# get a documnet
document = "http://baidu.com"
# get it's URL
console.log document.URL 

document1 = 
  "
    <!DOCTYPE html>
    <html>
      <head><title>study</title></head>
      <body>Hello World!</body>
    </html>
  "
body = document.body
console.log document1
console.log body
