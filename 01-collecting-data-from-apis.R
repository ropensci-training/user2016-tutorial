## indicative live code if following along with the slides
## 01-collecting-data-from-apis.pdf

library(httr)

x <- GET('https://google.com/')

str(x)
class(x)
names(x)

x$headers
x$status_code
x$content

GET("https://httpbin.org/get")

POST("https://httpbin.org/post")

x <- POST("https://httpbin.org/get")
x$status_code

x <- GET("https://httpbin.org/post")
x$status_code

url <- "https://httpbin.org/"

# Request with query parameters
x <- GET(url, query = list(a = 5))
x$url

# Request with headers
x <- GET(url, add_headers(wave = "hi"))
x$request$headers

# Request with a body
x <- POST("https://httpbin.org/post", body = list(a = 5))
x <- POST(modify_url(url, path = "post"), body = list(a = 5))
x$url
x$request$fields

x <- GET('https://google.com/')
x$content
content(x)

res <- GET("http://httpbin.org/get")
http_status(res)
res$request$headers
headers(res)

res$headers$`content-type`
# change accept content type
res <- GET("http://httpbin.org/get", accept_json())

res400 <- GET("http://httpbin.org/status/400")
res500 <- GET("http://httpbin.org/status/500")
content(res400)
content(res500)

j1 <- GET("http://www.omdbapi.com/?t=iron%20man%202&r=json")
content(j1, as = "text")
content(j1, as = "parsed")

x1 <- GET("http://www.omdbapi.com/?t=iron%20man%202&r=xml")
content(x1, as = "text")
content(x1, as = "parsed")
