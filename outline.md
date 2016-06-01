Outline: Extracting data from the web APIs and beyond
================
June 1, 2016

1.  Collecting data from an API (*All exercises with* <http://www.omdbapi.com/> )
    1.  What is an API? (<https://zapier.com/learn/apis/>)
        1.  High level summary of HTTP that includes how it works, what it looks like, and how students are using it daily even if they do not realize it. B. HTTP and R with `httr` (<https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html>)
        2.  Install and load `httr`
        3.  HTTP verbs
            1.  GET, POST, PUT, DELETE
            2.  `GET()` - saves a response object, whatever is returned from the server
            3.  How to assemble a query

        4.  HTTP structure
            1.  The data sent back from the server consists of three parts:
            2.  The status line
                1.  `status()`
                2.  deciphering status codes

            3.  Headers
                1.  `headers()`

            4.  The body
                1.  `content()`

        5.  Data Formats
            1.  JSON
                1.  Context: How to interpret the structure. When it is used. Why use it.
                2.  `content(json, as = "parsed", type = "application/json")`

            2.  XML
                1.  Context: How to interpret the structure. When it is used. Why use it.
                2.  `content(xml, as = "parsed")`

        6.  Other Verbs
            1.  A brief reminder and description/demo of
                1.  `POST()`
                2.  `PUT()`
                3.  `DELETE()`
                4.  `HEAD()`
                5.  `PATCH()`

2.  Wrapping an API with an R package (*All exercises build on code in previous part*)
    1.  Packages that wrap web API's
        1.  Tour several inspiring examples from ROpenSci

    2.  The quickest way to make a package (<https://www.rstudio.com/resources/webinars/rstudio-essentials-webinar-series-programming-part-3/>)
        1.  R Packages - a reminder that an R package is just an agreed upon file format that does not necessarily need to be hosted on CRAN. An example of an R package on github.
        2.  To make a package (with a handout)
            1.  In the RStudio IDE, open a new session
            2.  File &gt; New Project &gt; New Directory &gt; Package
            3.  Edit DESCRIPTION
            4.  Edit R files
            5.  Build &gt; More &gt; Document
            6.  Build &gt; More &gt; Build Source Package

        3.  To load a package (on same handout)
            1.  Packages &gt; Install &gt; Install From &gt; Package Archive File &gt; Install

    3.  Tips for APIs (<https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html>)
        1.  Strategy
        2.  Negotiating Content
            1.  What is content negotiation?
            2.  `accept_json()`
            3.  `accept_xml()`

        3.  Handling errors
            1.  `warn_for_status()`
            2.  `stop_for_status()`

        4.  Authentication
            1.  Background context for web authentication
            2.  Basic authentication
                1.  How it works
                2.  `authenticate("username", "password")`
                3.  Weaknesses

            3.  OAuth1
                1.  How it works
                2.  No longer common
                3.  `oauth1.0_token()`

            4.  OAuth2
                1.  How it works
                2.  Strengths
                3.  `oauth2.0_token()`

            5.  Best practices for API keys

3.  Web Scraping with R (*All exercises with IMDB*)
    1.  What if data is on a web page but there is no API? You can attempt to extract the data from the structure of the web page.
        1.  What is a web page?
        2.  HTML basics
        3.  CSS basics
        4.  Strategy: identify information by it's CSS selector

    2.  `rvest` (<https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html>)
        1.  selectorGadget
            1.  Installation instructions
            2.  Demo

        2.  Reading a page's DOM
            1.  `readHTML()`

        3.  Extracting information
            1.  `html_nodes()`
            2.  `html_text()`
            3.  `html_name()`
            4.  `html_attr()`
            5.  `html_children()`
            6.  `html_table()`

    3.  Perhaps more practice here than in the other parts
