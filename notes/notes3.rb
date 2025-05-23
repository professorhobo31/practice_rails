#### MVC: Model, View, Controller
# The Model should contain all the logic, the data (DB) and state of the app
# The View generates the user interface, doesn't do any processing
# The Controller receives requests, interacts with the Model, then displays the appropiate View

#### REQUEST > ROUTES.rb > PAGE_CONTROLLER.rb > VIEWS/PAGE.HTML.ERB

root to: "kittens#index"  # kittens controller, index action (method) in routes.rb. A line like this will send us first to readt the "kittens" controller

#### RESTful routes ####
## REST (i.e. Representation State Transfer) is an architectural style for defining our routes. It is a way of mapping HTTP routes and the CRUD (Create, Read, Update, and Delete) functionalities. The advantage of following this pattern, is we don’t have to reinvent the wheel every time you build a new CRUD app. The routes and method names have already been decided, so that we can just focus on the app itself. The seven routes are:
# ROUTE                                  # DESCRIPTION                                # Route Name    #HTTP Verb     #URL
get "/posts", to: "posts#index"          # Display a list of posts                    # Index         #GET           #/posts
get "/posts/new", to: "posts#new"        # Show a form to make a new post             # New           #GET           #/posts/new
post "/posts", to: "posts#create"        # Add new post to DB, then, redirect         # Create        #POST          #/posts
get "/posts/:id", to: "posts#show"       # Show info about a post                     # Show          #GET           #/posts/:id
get "/posts/:id/edit", to: "posts#edit"  # Show edit form of one post                 # Edit          #GET           #/posts/:id/edit
put "/posts/:id", to: "posts#update"     # Update a particular post, then redirect    # Update        #PUT           #/posts/:id
delete "/posts/:id", to: "posts#destroy" # Delete a particular post, then redirect    # Destroy       #DELETE        #/posts/:id

## Notice how several of those routes submit to the SAME URL… they just use different HTTP verbs, so Rails can send them to a different controller action. The other thing to notice is that the “id” field is prepended by a colon… that just tells Rails “Look for anything here and save it as the ID in the params hash”. It lets you submit a GET request for the first post and the fifth post to the same route, just a different ID:
/posts/1  # going to the #show action of the PostsController
/posts/5  # also going to the #show action of PostsController
# We can access that ID directly from the controller by tapping into the params hash where it got stored

## Since it is so common to use this format all the time, Ruby came with a helper method that lets us do it in one line:
### in config/routes.rb
#  ...
#  resources :posts
#  ...
## If we don't want all seven RESTful routes, we do instead: 
#  resources :posts, only: [:index, :show]
#  resources :users, except: [:index]


## After our routes.rb file has some initial routes setup, we can see them by typing "rails routes" or "rails routes --expanded" in the terminal. We can see the incoming HTTP verb and URL in the middle columns, then the controller action they map to on the right, which should all be quite familiar because as we just wrote it in the routes file. The (.:format) just means that it’s okay but not required to specify a file extension like .doc at the end of the route… it will just get saved in the params hash for later anyway. On the leftmost column there's the “name” of the route. This last one is handy with the link_to Ruby method, we generally NOT want to hard code the URLS, because we’ll be out of luck when we decide to change the URLs and have to manually go in and change them in the code):

link_to "Edit this post", edit_post_path(3) # don't hardcode 3!!! We supply "link_to" with the text that we want to show and the URL to link it to. 
# "edit_post_path(3)" will generate the path "/posts/3/edit". Rails automatically generates helper methods for you which correspond to the names of all the routes. These methods end with _path and _url. path, as in edit_post_path(3), will generate just the path portion of the URL, which is sufficient for most applications. url will generate the full URL. Any routes which require us to specify an ID or other parameters will need us to supply those to the helper methods as well (like we did above for edit with that 3). You can also put in a query string by adding an additional parameter:
post_path(3, :referral_link => "/some/path/or/something")
# Now the :referral_link parameter would be available in the params hash in the controller in addition to the normal set of parameters.

## In a conceptual sense, once the routes file defines our RESTful routes, our app will look for the controller for the posts page that will look something like this:
  # in app/controllers/posts_controller.rb
  class PostsController < ApplicationController   # Always remember this line to import the default Ruby stuff

    def index
      # code to grab all posts so they can be
      # displayed in the Index view (index.html.erb)
    end

    def show
      # code to grab the proper Post so it can be
      # displayed in the Show view (show.html.erb)
    end

    def new
      # code to create an empty post and send the user
      # to the New view for it (new.html.erb), which will have a
      # form for creating the post
    end

    def create
      # code to create a new post based on the parameters that
      # were submitted with the form (and are now available in the
      # params hash)
    end

    def edit
      # code to find the post we want and send the
      # user to the Edit view for it (edit.html.erb), which has a
      # form for editing the post
    end

    def update
      # code to figure out which post we're trying to update, then
      # actually update the attributes of that post. Once that's
      # done, redirect us to somewhere like the Show page for that
      # post
    end

    def destroy
      # code to find the post we're referring to and
      # destroy it.  Once that's done, redirect us to somewhere fun.
    end
  end

## ADD A LIL TEST TO SEE IF ACCOUNT MIGRATION TO NEW USERNAME WORKED