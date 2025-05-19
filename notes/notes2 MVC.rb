## The MODEL --- VIEW --- CONTROLLER (MVC) Pattern:
## This file is meant to help us understand AND REMEMBER how the Rails architecture works. It uses the MVC pattern to decide how it processes the requests, where to find info in the database and how to render the page.

## When a request arrives, for example a request to go to our about page:
# GET /about HTTP/1.1
# Host: 127.0.0.1
## Rails will understand there's a GET request looking for the "/about" route


#### Routes
## They're matchers for the URL that's requested. On our example, they'd see a GET for "/about". Rails will go "I see you requested the "/about" content, we'll pass that to the AboutController to handle it"

#### Models
## They're our database wrapper. They allow us to to take our user data and:
# Query for records
# Wrap individual records

#### Views
## The response body content. Can be:
# HTML
# CSV
# PDF
# XML

## Its what gets sent to our browser and displayed

#### Controllers
## They decide how to process a request and define what the response will be. They contain logic so they can say "hey, you tried to create an account but the password wasn't long enough so we'll send you again to the page where you write it". It chooses where requests go
