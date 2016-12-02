## indicative live code if following along with the slides
## 02-wrapping-an-api-with-R.pdf

library(httr)
## purrr and listviewer are used in optional code below

## https://swapi.co
## https://swapi.co/documentation

web_call <- GET('http://swapi.co/api/planets/1/')
web_call

result <- GET('api.randomuser.me')
status_code(result)

result_2 <- GET('api.openweathermap.org/data/2.5/forecast?id=524901')
status_code(result_2)

## bonus content, more GETs to try
#GET('http://swapi.co/api/starships/9/')
#GET('http://swapi.co/api/vehicles/4/')
#GET('http://www.anapioficeandfire.com/api/characters/1')

call <- GET("http://google.com")
result <- content(call, as = 'text')
result

## place a GET request
result <- GET('api.randomuser.me')
status_code(result)

## get the good stuff, the content!
result$content                 ## raw bytes!
content(result, as = "text")   ## as text
content(result, as = "parsed") ## let httr guess what it is
## ok for exploratory, interactive work

## when you're being careful, check content type yourself
## and tell httr exactly how to parse it
headers(result)[["content-type"]]
person <- content(result, type = "application/json")

str(person, max.level = 2)
str(person$results, max.level = 2)
#listviewer::jsonedit(person$results)

## bonus content
## what if we ask for many planets from swapi?
planets_response <- GET('http://swapi.co/api/planets/')
status_code(planets_response)
headers(planets_response)[["content-type"]]
planets <- content(planets_response, type = "application/json")
str(planets, max.level = 1)
str(planets$results, max.level = 1)
#listviewer::jsonedit(planets$results)

library(purrr)
planets$results %>%
  map_chr("name")
planets$results %>%
  map_df(`[`, c("name", "climate"))

## passing query parameters
num_results <- 5
args <- list(results = num_results)
random_names <- GET("http://api.randomuser.me/",
                    query = args)
random_names$url ## see how your query shows up?
output <- content(random_names, as = 'parsed')
length(output$results)
#listviewer::jsonedit(output$results)

## bonus content
## using a query parameter to do a search-based GET on swapi
## example on website
r2d2_response <- GET('https://swapi.co/api/people/?search=r2')
status_code(r2d2_response)
r2d2 <- content(r2d2_response, as = "parsed")
#listviewer::jsonedit(r2d2)
#listviewer::jsonedit(r2d2$results)

## retrieves darth vader AND darth maul
darth_response <- GET('https://swapi.co/api/people/?search=darth')
status_code(darth_response)
darth <- content(darth_response, as = "parsed")
#listviewer::jsonedit(darth$results)

darth$results %>%
  map_df(`[`, c("name", "skin_color", "eye_color"))
