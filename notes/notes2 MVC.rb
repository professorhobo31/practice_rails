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

######################### PART 5 EXECUTION #########################

## In our example website, to create a new page we follow this path:
# INCOMING HTTP REQUEST GET /page > config/routes.rb > app/controllers/page_controller.rb > app/views/page/index.html.erb

# 1st we locate the "routes.rb" file in the config folder. We add a route for a new request we're setting up, that will point to a controller. In our example case, we created a route to the about page in routes.rb (get "about", to: "about#index"). At this point, whenever the server receives a GET requesting our about page, it'll search for an about controller and try to execute the index action. This action will do nother rn, but Rails will look for a file named like it inside a specific folder, and load it.
# After this, we open the app/controllers folder. On it we create a file called "about_controller.rb", with a class named AboutController (the names of the file & class are written specifically so, to match the one that what we set up in the routes. Keep in mind the underscores and capitalization). With our index action in place, Rails will now look for the content to render in the app/views folder.
# In the app/views folder we create a FOLDER with the name of our page, in this case a folder named ABOUT. Inside that folder that the program loads, our page is contained inside the index.html.erb file. We DON'T need the usual HTML skeleton, the wrapper for our layout is located in app/views/layouts/application.html.erb.

# (Following this process we create the main landing page and define it as such by usint "root to: "<page>"" in the routes.rb file)



######################### PART 7 BOOTSTRAP #########################
# Whenever we want to quickly add Bootstrap to a project, we head out to https://getbootstrap.com/ to the download section and copy the links under the "CDN via jsDelivr" tab. We then need to head to views/layouts and look for the application.html.erb file that contains the CSS header for the entire page. We copy-paste them above the "stylesheet_link_tag" lines. Once we make sure the styles are working, we proceed to add a Navbar. We picked a simple one and added it thru a <%= render partial: "path" %> line that links to app/views/shared (we create it)/_navbar.html-erb
# In that _navbar.html-erb file we dump all the HTML for the navbar so we can tweak it and work with it in an easier way. We can handle multiple pieces of a page this way, isolating HTML working piecemeal at different elements and then adding it to our pages through render calls on Rails.
