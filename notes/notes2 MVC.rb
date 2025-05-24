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

# (Following this process we create the main Landing Page and define it as such by usint "root to: "<page>"" in the routes.rb file)



######################### PART 7 BOOTSTRAP #########################
# Whenever we want to quickly add Bootstrap to a project, we head out to https://getbootstrap.com/ to the download section and copy the links under the "CDN via jsDelivr" tab. We then need to head to views/layouts and look for the application.html.erb file that contains the CSS header for the entire page. We copy-paste them above the "stylesheet_link_tag" lines. Once we make sure the styles are working, we proceed to add a Navbar. We picked a simple one and added it thru a <%= render partial: "path" %> line that links to app/views/shared (we create it)/_navbar.html-erb
# In that _navbar.html-erb file we dump all the HTML for the navbar so we can tweak it and work with it in an easier way. We can handle multiple pieces of a page this way, isolating HTML working piecemeal at different elements and then adding it to our pages through render calls on Rails.
# When working with links, we should keep in mind that we can use Ruby's link_to method to point to the direction of the page in a way that is easier to update if we change the paths later down the line. By typing "rails routes" in the terminal at any point of working in our project, we can see at the top (under rails_health_check) all the route names in our app under prefix. We replace the anchor line with the snippet of code <%= link_to "About", about_path, class: "nav-link" %>. THEN we go to out paths and add "as: :about" to the route of our about page. After that, the name changes to it stop mattering.



######################### PART 10 FLASH MESSAGES ###################
# With our page somewhat setup, we wanna start adding a new feature to our app. From the previously commited version of the project (that changed the anchor tags for link_to lines), we wanna add the flash messages that bootstrap has. We can call them with the inherited "flash" command on our controller files (it comes from the main ApplicationController we inherit all our base controllers from). After adding them in our main_controller.rb, we go to our application.html.erb file and add a partial render for them, as they need to be shared throughout the entire page. This partial render links to our shared folder to a new file named _flash.html.erb. There we add our warnings thru a <%= flash[:warning] %> ruby tag. We format the warnings to have a close button and be color-coded.
# At this point a problem arises, which is that if we load the About page, the cookies from the previously loaded Landing Page make the alert boxes load, but not their HTML content and thus they render as empty. (we can visualize by adding an .inspect to the flash call in flash.html.erb). The fix is to wrap them in an if statement that checks wether the controller calls for the alerts to render. We also add a flash.now in our controller so it doesn't persist on cookies. This should make them dissapear on the second click to the about page. After this, our Landing Page should display all alerts but not our About page. After we're done, we comment them out in our main page controller so we can use them later.
# An important new nugget of knowledge is we can use git add -p to add our local changes in chunks, if we went overboard since the latest commit.


######################### PART 11 USER MODEL #######################
# We now want to turn our eye towards the backend and user registration, which will be the main use for our previously made alerts. For this we need to create a DATABASE MODEL. Ours should be named User and contain data for their email in a string and a password_digest in another string (we want our passwords hashed and safe). We can achieve this by running "rails generate model User email:string password_digest:string" in the console. We then need to run "rails db:migrate" to create that database table. The model generator only creates the migration file and then we can undo and redo anytime thru migrations to control the fields. Once we go into production, we don't want to ever lose data on our DB and if anything, we want just to add new columns so that, at most, older users get an empty cell in some of the fields. Notice how our new model is added in app/models/user.rb. Next we need to go into our Gemfile and enable bcrypt so that our passwords can be properly hashed. After we uncomment the line, we run the "bundle" command on our terminal so that bcrypt is added. Next we open the rails console by entering the command "rails c" into the terminal.
# To fix the problem of blank emails being allowed we do two things: we go to the user model and add the "validates_presence_of :email" line (ruby protection) and we go to db/migrate 20250521203403_create_users.rb and add "null: false" to the email string attribute (db protection). In order for the last one to apply, we need to do a "rails db:rollback" and then a "rails db:migrate" in order for the changes to take effect (will reset DB in the process). We can also use "rails db:redo" or rails db:migrate:redo. We can see if a user is rejected because it'll turn to a null ID in the rails console after attempting to create it. There are validations for format also.
# With this our initial DB setup will be complete and we'll want to create our registration page next.

######################### PART 13 SIGN-UP ##########################
# We now want to create our Sign-Up page. To start, we go to routes.db and follow the usual process. We then enter a <%= form_with model: @user, url: sign_up_path do |form| %> Ruby code snippet so it generates our sign up forms for us, if in a very basic shape. We point it to the correct URL in our routes.rb file so that the sign_up route can handle both GET and POST requests. The registration controller, so far, only needs to call upon the app/views/registration/new.html.erb file. In order to make the form look better, we wrap each line inside the Ruby form_with block with a div, and style it with bootstrap which we already know how to do.
# After we add a button to submit our form, we now want to go back to the routes.rb file. We see that once our browser sends the POST html request with our form info to the sign_up URL, it will look to the create action in the registrations_controller.rb file. Since we haven't yet defined this, it'll throw an error when we press that button. We want some logic in our controller to pass the data to our DB and so we use the params
######################### PART 13 LOG-IN ###########################
# When a user is successfuly gets created, we need to also keep it signed in. At this point in the project we only redirect him.
